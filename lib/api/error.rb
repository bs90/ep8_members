# frozen_string_literal: true

module Api
  class BaseError < StandardError
    attr_reader :message, :code

    def initialize code: nil, message: nil
      @code = code
      @message = message
    end

    def serialize
      [{code:, message: @message}]
    end

    def to_hash
      {errors: serialize}
    end
  end

  class ExecuteFailed < BaseError
    attr_reader :type, :file_path, :i18n_scope

    def initialize type, error_detail, error_agrs = {}
      @type = type
      @file_path = caller(0, 3).last.match(file_path_regex)[0]
      @i18n_scope = get_i18n_scope
      error = I18n.t error_detail, scope: i18n_scope
      @code = error[:code]
      @message = error[:message]
      error_agrs.each { |k, v| message.gsub!("%{#{k}}", v) }
    end

    private
    def get_i18n_scope
      file_path.split(%r{/})[3..].map { |e| e.gsub file_suffix, "" }
    end

    def file_path_regex
      case type
      when :controller
        %r{/app/(controllers)/.*.rb}
      else
        %r{/app/(services)/.*.rb}
      end
    end

    def file_suffix
      case type
      when :controller
        /_controller.rb/
      else
        /_service.rb/
      end
    end
  end

  module Error
    class ServiceExecuteFailed < ExecuteFailed
      def initialize error_detail, error_agrs = {}
        super(:service, error_detail, error_agrs)
      end
    end

    class ControllerRuntimeError < ExecuteFailed
      def initialize error_detail
        super(:controller, error_detail)
      end
    end

    class RecordNotFound < BaseError
      attr_reader :error

      def initialize error
        @error = error
      end

      def to_hash
        RecordNotFoundSerializer.new(error).serialize
      end
    end

    class BadRequestController < BaseError; end
  end
end
