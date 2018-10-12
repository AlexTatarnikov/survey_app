class Response < ApplicationRecord
  belongs_to :survey
  belongs_to :user

  validates :answers, presence: true
  validates :survey_id, uniqueness: { scope: :user_id }
  validate :ensure_answers

  private

  def ensure_answers
    return if survey_id.blank? || answers.blank?

    survey.questions.required.each do |question|
      if answers.dig(question.id.to_s, 'value').blank?
        errors.add(question.id.to_s, I18n.t('errors.messages.blank'))
      end
    end
  end
end
