# frozen_string_literal: true

module ActiveRecordValidation
  class Error
    attr_reader :record

    def initialize record
      @record = record
    end

    # rubocop:disable Metrics/AbcSize
    def serialize full_message: true
      return unless record

      full_messages = record.errors.to_hash full_message
      record.errors.messages
      record.errors.details.map do |field, details|
        detail = details.first
        invalid_type = :unprocessable_entity
        message = full_messages[field].first
        convert_to_serializer field, detail, message, invalid_type
      end.flatten
    end
    # rubocop:enable Metrics/AbcSize

    def convert_to_serializer field, detail, message, invalid_type
      ValidationErrorSerializer.new(record, field, detail, message, invalid_type).serialize
    end

    def to_hash
      {errors: serialize}
    end
  end
end
