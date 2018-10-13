require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Admin/Survey' do
  let(:admin) { create :admin }
  let(:token) { admin.authentication_token }

  header 'content-type', 'application/json'
  header 'accept', 'application/json'
  header 'Authorization', :token

  with_options scope: :survey, required: true do
    parameter :title, 'Title'
    parameter :subtitle, 'Subtitle'
  end

  with_options scope: [:survey, :questions_attributes, Time.now.to_i] do
    parameter :title, 'Title', method: :question_title
    parameter :kind, 'Kind', method: :question_kind
    parameter :placeholder, 'Placeholder', method: :question_placeholder
    parameter :required, 'Required', method: :question_required
    parameter :choices, 'Choices', method: :question_choices
  end

  let(:title) {'Third Doctor'}
  let(:subtitle) {'This is my timey-wimey detector. It goes \'ding\' when there\'s stuff.'}

  let(:question_title) { 'In the beginning, the Universe was created. This has made a lot of people very angry and been widely regarded as a bad move.' }
  let(:question_kind) { 'text' }
  let(:question_placeholder) { 'We must find the men of science and institutes of learning, surely they are out there still.' }
  let(:question_required) { true }
  let(:question_choices) { %w(1 2 3) }

  post 'api/v1/admins/surveys' do
    example_request 'Create' do
      expect(status).to eq(201)
      expect(parsed_body).to match(
        {
          data: {
            id: an_instance_of(String),
            type: 'survey',
            attributes: {
              id: an_instance_of(Integer),
              title: title,
              subtitle: subtitle
            },
            relationships: {
              questions: {
                data: [
                  {id: an_instance_of(String), type: 'question'}
                ]
              },
              response: {
                data: nil
              }
            }
          },
          included: [
            {
              id: an_instance_of(String),
              type: 'question',
              attributes: {
                id: an_instance_of(Integer),
                kind: question_kind,
                required: question_required,
                title: question_title,
                placeholder: question_placeholder,
                choices: question_choices
              }
            }
          ]
        }
      )
    end
  end

  post 'api/v1/admins/surveys' do
    example_request 'Create - errors', survey: { title: nil } do
      expect(status).to eq(422)
    end
  end
end
