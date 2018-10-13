require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'User' do
  header 'content-type', 'application/json'
  header 'accept', 'application/json'

  post 'api/v1/users/registrations' do
    with_options scope: :sign_up, required: true do
      parameter :email, 'Email'
      parameter :first_name, 'First Name'
      parameter :last_name, 'Last Name'
      parameter :password, 'Password'
    end

    let(:email) { 'sasha@grey.com' }
    let(:first_name) { 'Sasha' }
    let(:last_name) { 'Grey' }
    let(:password) { 'password' }

    example_request 'Creating a user account' do
      expect(status).to eq(200)
    end

    example_request 'Creating a user account - errors', sign_up: {password: ''} do
      expect(status).to eq(422)
    end
  end
end
