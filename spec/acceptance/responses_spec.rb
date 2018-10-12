require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Response' do
  let(:user) { create :user }
  let(:token) { user.authentication_token }

  header 'accept', 'application/json'
  header 'Authorization', :token

  post 'api/v1/users/surveys/:survey_id/response' do
    with_options scope: :response, required: true do
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
            type: 'response',
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

  post 'api/v1/users/surveys/:survey_id/response' do
    let(:response) { create :response, user: user }
    let(:survey_id) { response.survey_id }

    example_request 'Create - errors', response: {answers: ''} do
      expect(status).to eq(422)
    end
  end

  get 'api/v1/users/surveys/:survey_id/response' do
    let(:response) { create :response, user: user }
    let(:survey_id) { response.survey_id }

    example_request 'Show' do
      expect(status).to eq(200)
      expect(parsed_body).to eq(
        {
          data: {
            id: response.id.to_s,
            type: 'response',
            attributes: {
              survey_id: survey_id,
              answers: response.answers.deep_symbolize_keys
            }
          }
        }
      )
    end
  end
end
