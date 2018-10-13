FactoryBot.define do
  factory :response do
    survey
    user

    before(:create) do |response|
      question = response.survey.questions.first || create(:question, survey: response.survey)

      response.answers = {
        question.id => {
          title: question.title,
          kind: question.kind,
          placeholder: question.placeholder,
          choices: question.choices,
          value: question.choices.sample
        }
      }
    end
  end
end
