# frozen_string_literal: true

class Api::BaseController < ActionController::API
  include Api::V1::BaseConcern
end
