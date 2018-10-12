class Api::V1::SurveysController < Api::V1::BaseController
  before_action :authenticate_user

  def show
    @survey = Survey.find(params[:id])

    respond_with(SurveySerializer.new(@survey, include: %i[questions]).serializable_hash)
  end
end
