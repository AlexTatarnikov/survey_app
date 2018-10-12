require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Survey' do
  let(:user) { create :user }
  let(:token) { user.authentication_token }

  header 'accept', 'application/json'
  header 'Authorization', :token

  get 'api/v1/surveys/:id' do
    let(:survey) { create :survey }
    let!(:question) { create :question, survey: survey }
    let(:id) { survey.id }

    example_request 'Show' do
      expect(status).to eq(200)
      expect(parsed_body).to eq(
        {
          data: {
            id: survey.id.to_s,
            type: 'survey',
            attributes: {
              id: survey.id,
              title: survey.title,
              subtitle: survey.subtitle
            },
            relationships: {
              questions: {
                data: [
                  {id: question.id.to_s, type: 'question'}
                ]
              }
            }
          },
          included: [
           {
             id: question.id.to_s,
             type: 'question',
             attributes: {
               id: question.id,
               kind: question.kind,
               required: question.required,
               title: question.title,
               placeholder: question.placeholder,
               choices: question.choices
             }
           }
         ]
        }
      )
    end
  end
end
