require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Admin' do
  header 'content-type', 'application/json'
  header 'accept', 'application/json'

  post 'api/v1/admins/tokens' do
    with_options scope: :sign_in, required: true do
      parameter :email, 'Email'
      parameter :password, 'Password'
    end

    let!(:admin)  { create :admin, email: 'batman@gotham.com' }
    let(:email) { 'batman@gotham.com' }
    let(:password) { 'password' }


    example_request 'Get auth token' do
      expect(status).to eq(201)
    end

    example_request 'Get auth token - errors', sign_in: {email: 'sasha@grey.com'} do
      expect(status).to eq(404)
      expect(parsed_body).to eq({errors: {message:'Incorrect email or password.'}})
    end

    example_request 'Get auth token - errors - bad request', sign_in: nil do
      expect(status).to eq(400)
      expect(parsed_body).to eq({errors: {message: 'param is missing or the value is empty: sign_in'}})
    end
  end
end
