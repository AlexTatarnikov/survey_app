class Api::V1::Admins::SurveysController < Api::V1::BaseController
  before_action :authenticate_admin

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      respond_with(SurveySerializer.new(@survey, include: %i[questions]).serializable_hash)
    else
      respond_with_error(@survey)
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :subtitle,
                                   questions_attributes: [:title, :kind, :placeholder,
                                                          :required, choices: []])
  end
end
