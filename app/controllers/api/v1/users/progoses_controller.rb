# frozen_string_literal: true

class Api::V1::Users::ProgosesController < Api::BaseController
  before_action :set_user, only: [:create]

  def index
    pagy_info,progoses = paginate Progose.all

    render_jsonapi progoses, type: :basic_info, meta: {pagy_info: pagy_info}
  end

  def show
    progose = Progose.find(params[:id])

    render_jsonapi progose, type: :detail_info
  end

  # POST /api/v1/users/progoses
  def create
    progose = @user.progoses.create!(progose_params)

    render_jsonapi progose, type: :detail_info
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def progose_params
    params.permit(:date_test, :range, :range_evaluation,:accuracy, :accuracy_evaluation,
                  :fluency, :fluency_evaluation,:interaction, :interaction_evaluation,:coherence, :coherence_evaluation,
                  :phonology, :phonology_evaluation, :overall, :overall_evaluation)
  end
end
