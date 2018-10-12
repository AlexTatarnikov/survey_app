require 'rails_helper'

RSpec.describe Summary, type: :model do
  it { is_expected.to belong_to :survey }

  it { is_expected.to validate_presence_of :answers }
end
