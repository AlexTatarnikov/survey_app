require 'rails_helper'

RSpec.describe Summary, type: :model do
  it { is_expected.to belong_to :survey }

  it { is_expected.to validate_presence_of :answers }

  describe 'uniqueness' do
    before { create :summary }

    it { is_expected.to validate_uniqueness_of(:survey_id).scoped_to(:user_id) }
  end
end
