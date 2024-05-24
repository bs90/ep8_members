# frozen_string_literal: true

class RecordNotFoundSerializer
  def initialize error
    @error = error
    @resource = error.model.underscore
    @detail = error.class.to_s.split("::")[1].underscore
  end

  def serialize
    {
      errors: [
        {
          resource:,
          code:,
          invalid_type: :not_found,
          message: I18n.t(:not_found, scope: [:errors, :active_record])
        }
      ]
    }
  end

  private
  attr_reader :error, :resource

  def code
    I18n.t @detail,
           scope: [:errors, :code],
           default: @detail.to_s
  end
end
