class SurveySerializer < ApplicationSerializer
  attributes :id, :title, :subtitle
  has_many :questions
end
