# frozen_string_literal: true

module Api::V1::JsonRenderer
  extend ActiveSupport::Concern

  class DataSanitizer
    def initialize object, options, api_version
      @object = object
      @options = options
      @root = options[:root]
      @meta = options[:meta]
      @api_version = api_version
    end

    def sanitize
      case object
      when ActiveRecord::Relation, Array
        @root ||= klass_name.tableize
        {root => sanitized_array_data, meta:}
      when Hash
        root ? {root => sanitized_data} : sanitized_data
      else
        @root ||= klass_name.underscore
        {root => sanitized_data}
      end
    end

    private
    attr_reader :object, :options, :api_version, :root, :meta

    def sanitized_data
      @sanitized_data ||= serializer.new object, opts
    end

    def sanitized_array_data
      @sanitized_array_data = ActiveModel::Serializer::CollectionSerializer.new(object, opts)
    end

    def klass_name
      @klass_name ||= (object.respond_to?(:klass) ? object.klass : object.class).name.split("::").first
    end

    def serializer
      @serializer ||=
        unless klass_name == Array.name
          options[:serializer] || "Api::#{api_version}::#{klass_name}Serializer".constantize
        end
    end

    def opts
      @opts ||= options.except(:status, :meta, :root).merge namespace: "Api::#{api_version}"
    end
  end

  protected
  included do
    def render_jsonapi object, options = {}
      status = options.fetch :status, :ok
      response_data = DataSanitizer.new(object, options, api_version).sanitize

      render json: response_data, status:
    end
  end

  def api_version
    @api_version ||= request.path.split("/")[2].classify
  end
end
