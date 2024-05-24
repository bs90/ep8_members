# frozen_string_literal: true

module Api::V1::BaseConcern
  extend ActiveSupport::Concern

  include Api::V1::JsonRenderer
  include Api::V1::Pagination
  include Api::V1::RescueExceptions
  include LocaleConcern
end
