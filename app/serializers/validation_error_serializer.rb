# frozen_string_literal: true

class ValidationErrorSerializer
  def initialize record, field, details, message, invalid_type
    @record = record
    @field = field
    @details = details
    @invalid_type = invalid_type
    @message = message
  end

  def serialize
    {
      resource:,
      field:,
      code:,
      invalid_type:,
      message:
    }
  end

  private
  attr_reader :record, :message, :invalid_type, :details

  def resource
    I18n.t underscored_resource_name,
           scope: [:errors, :resources],
           default: underscored_resource_name
  end

  def field
    I18n.t @field,
           scope: [:errors, :fields, underscored_resource_name],
           default: @field.to_s
  end

  def code
    I18n.t @details[:error],
           scope: [:errors, :code],
           default: @details[:error].to_s
  end

  def underscored_resource_name
    record.class.to_s.gsub("::", "").underscore
  end
end
