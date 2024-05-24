# frozen_string_literal: true

module Api::V1::RescueExceptions
  extend ActiveSupport::Concern

  included do # rubocop:disable Metrics/BlockLength
    rescue_from StandardError, with: :render_standard_error_response
    rescue_from(
      ActiveRecord::RecordInvalid,
      ActiveRecord::RecordNotUnique,
      ActiveRecord::RecordNotDestroyed,
      ActiveModel::UnknownAttributeError,
      with: :render_unprocessable_entity_response
    )
    rescue_from(
      Api::Error::ServiceExecuteFailed,
      Api::Error::ControllerRuntimeError,
      with: :render_execute_failed_response
    )
    rescue_from ActiveRecord::RecordNotFound, with: :render_resource_not_found_response
    rescue_from Api::Error::BadRequestController, with: :render_bad_request_controller_response

    protected
    def render_unprocessable_entity_response exception, status: :unprocessable_entity
      render json: ActiveRecordValidation::Error.new(exception.record).to_hash, status:
    end

    def render_execute_failed_response exception, status: :bad_request
      response_body = exception.to_hash
      logger.info "[EXECUTE_FAILED]: #{response_body}"

      render json: response_body, status:
    end

    def render_resource_not_found_response exception, status: :not_found
      render json: Api::Error::RecordNotFound.new(exception).to_hash, status:
    end

    def render_standard_error_response exception, status: :internal_server_error
      error = Api::BaseError.new I18n.t("errors.something_went_wrong")
      logger.info "[STANDARD_ERROR]: #{exception} \
        \n\t#{exception.backtrace.first}"

      render json: error.to_hash, status:
    end

    def render_bad_request_controller_response exception, status: :bad_request
      error = Api::BaseError.new exception.message

      render json: error.to_hash, status:
    end
  end
end
