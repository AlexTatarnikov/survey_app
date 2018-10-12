require 'rails_helper'

RSpec.describe Response, type: :model do
  it { is_expected.to belong_to :survey }

  it { is_expected.to validate_presence_of :answers }

  describe 'uniqueness' do
    before { create :response }

    it { is_expected.to validate_uniqueness_of(:survey_id).scoped_to(:user_id) }
  end

  describe '#ensure_answers' do
    let(:response) { create :response }
    let(:question) { response.survey.questions.first }

    subject { response }

    it { is_expected.to be_valid }

    context 'when answers blank' do
      before { response.answers = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when answer value is blank' do
      before { response.answers = { question.id => { value: nil } } }

      it { is_expected.not_to be_valid }
    end
  end
end
