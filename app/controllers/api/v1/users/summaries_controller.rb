class Api::V1::Users::SummariesController < Api::V1::BaseController
  before_action :authenticate_user

  def create
    @summary = current_user.summaries.build(summary_params)

    if @summary.save
      respond_with(SummarySerializer.new(@summary).serializable_hash)
    else
      respond_with_error(@summary)
    end
  end

  private

  def summary_params
    params.require(:summary).permit(:survey_id).tap do |summary|
      summary[:survey_id] = params[:survey_id]

      if params[:summary].dig(:answers).present?
        summary[:answers] = params[:summary].fetch(:answers, ActionController::Parameters.new).permit!
      end
    end
  end
end
