# frozen_string_literal: true

class BaseSerializer < ActiveModel::Serializer
  def initialize object, option = {}
    @fields_custom = self.class.const_get option[:type].to_s.upcase
    super
  end

  def serializer_for data, type: :basic_info
    "Api::V1::#{data.class.name}Serializer".constantize.new data, type:
  end

  def collection_serializer_for data, type: :basic_info
    ActiveModel::Serializer::CollectionSerializer.new(
      data,
      serializer: "Api::V1::#{data.klass}Serializer".constantize,
      type:
    )
  end

  private
  attr_reader :fields_custom
end
