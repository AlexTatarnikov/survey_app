require 'rails_helper'

RSpec.describe Survey, type: :model do
  it { is_expected.to have_many(:questions).dependent(:delete_all) }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :subtitle }

  describe 'uniqueness' do
    before { create :survey }

    it { is_expected.to validate_uniqueness_of :title }
  end
end
