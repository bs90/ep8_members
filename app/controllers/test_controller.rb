# frozen_string_literal: true

class TestController < ActionController::API
  def index
    render json: {}, status: :ok
  end
end
