# frozen_string_literal: true

class Api::V1::Users::ProgosesController < Api::BaseController
  before_action :set_user, only: [:create]
  before_action :set_progose, only: %i(show update destroy)

  def index
    pagy_info, progoses = paginate Progose.newest

    render_jsonapi progoses, type: :basic_info, meta: {pagy_info:}
  end

  def show
    render_jsonapi @progose, type: :detail_info
  end

  def create
    progose = @user.progoses.create! progose_params

    render_jsonapi progose, type: :detail_info
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_progose
    @progose = Progose.find(params[:id])
  end

  def progose_params
    params.require(:progose).permit(Progose::PROGOSE_CREATE_ATTRS)
  end
end
