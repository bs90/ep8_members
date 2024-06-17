# frozen_string_literal: true

class Api::V1::Users::ProgosesController < Api::BaseController
  before_action :set_progose, only: %i(show update destroy)

  def index
    pagy_info, progoses = paginate current_user.progoses.newest

    render_jsonapi progoses, type: :basic_info, meta: {pagy_info:}
  end

  def show
    render_jsonapi @progose, type: :detail_info
  end

  def create
    progose = current_user.progoses.create! progose_params

    render_jsonapi progose, type: :detail_info, status: :created
  end

  def update
    @progose.update! progose_params

    render_jsonapi @progose, type: :detail_info
  end

  def destroy
    @progose.destroy!

    head :no_content
  end

  private

  def set_progose
    @progose = current_user.progoses.find(params[:id])
  end

  def progose_params
    params.require(:progose).permit(Progose::PROGOSE_CREATE_ATTRS)
  end
end
