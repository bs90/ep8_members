# frozen_string_literal: true

class Api::V1::Users::SessionsController < Api::BaseController
  skip_before_action :authenticate_user!

  def create
    google_service = LoginGoogleService.new(params[:id_token])
    user_google_info = google_service.get_user_google_info

    resource = User.find_by(email: user_google_info["email"], provider: "google_oauth2")
    @access_token = resource.tokens.create!
    response_with resource
  end

  private

  def response_with resource
    render json: {
      user: Api::V1::UserSerializer.new(resource, type: :basic_info),
      access_token: @access_token.access_token
    }
  end
end
