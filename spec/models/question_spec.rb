require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to :survey }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to define_enum_for(:kind).with([:number, :radio, :text, :checkbox, :rating]) }
end
