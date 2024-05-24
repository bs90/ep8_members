# frozen_string_literal: true

module LocaleConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_locale_from_accept_language
  end

  private

  def set_locale_from_accept_language
    accepted_language = request.headers["Accept-Language"]
    I18n.locale = if accepted_language.present? && [:ja, :en].include?(accepted_language.to_sym)
                    accepted_language.to_sym
                  else
                    :ja
                  end
  end
end
