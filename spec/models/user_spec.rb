require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_secure_password }

  it { is_expected.to have_many(:responses).dependent(:delete_all) }

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }

  describe 'uniqueness' do
    before { create :user }

    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
