require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { is_expected.to have_secure_password }

  it { is_expected.to validate_presence_of :email }

  describe 'uniqueness' do
    before { create :admin }

    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
