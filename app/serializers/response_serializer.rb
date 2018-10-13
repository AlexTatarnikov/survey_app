class ResponseSerializer < ApplicationSerializer
  attributes :survey_id, :answers
  belongs_to :survey
end
