class QuestionSerializer < ApplicationSerializer
  attributes :id, :kind, :required, :title, :placeholder, :choices
end
