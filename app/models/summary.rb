class Summary < ApplicationRecord
  belongs_to :survey
  belongs_to :user

  validates :answers, presence: true
  validates :survey_id, uniqueness: { scope: :user_id }
end
