class SurveySerializer < ApplicationSerializer
  attributes :id, :title, :subtitle
  has_many :questions

  belongs_to :response do |survey, params|
    params[:current_user]&.responses&.find_by(survey_id: survey.id)
  end
end
