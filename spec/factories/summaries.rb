FactoryBot.define do
  factory :summary do
    survey

    before(:create) do |summary|
      question = create(:question, survey: summary.survey)

      summary.answers = {
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
