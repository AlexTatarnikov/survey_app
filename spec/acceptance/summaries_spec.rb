require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Summary' do
  let(:user) { create :user }
  let(:token) { user.authentication_token }

  header 'accept', 'application/json'
  header 'Authorization', :token

  post 'api/v1/users/surveys/:survey_id/summary' do
    with_options scope: :summary, required: true do
      parameter :answers, 'Answers'
    end

    let(:survey) { create :survey }
    let!(:question) { create :question, survey: survey }
    let(:survey_id) { survey.id }
    let(:answer) { question.choices.sample }

    let(:answers) do
      {
        question.id => {
          title: question.title,
          kind: question.kind,
          placeholder: question.placeholder,
          choices: question.choices,
          value: answer
        }
      }
    end

    example_request 'Create' do
      expect(status).to eq(201)
      expect(parsed_body).to match(
        {
          data: {
            id: an_instance_of(String),
            type: 'summary',
            attributes: {
              survey_id: survey.id,
              answers: {
                :"#{question.id.to_s}" => {
                  title: question.title,
                  kind: question.kind,
                  placeholder: question.placeholder,
                  choices: question.choices,
                  value: answer
                }
              }
            }
          }
        }
      )
    end
  end

  post 'api/v1/users/surveys/:survey_id/summary' do
    let(:summary) { create :summary, user: user }
    let(:survey_id) { summary.survey_id }

    example_request 'Create - errors', summary: {answers: ''} do
      expect(status).to eq(422)
    end
  end
end
