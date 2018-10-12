class Summary < ApplicationRecord
  belongs_to :survey

  validates :answers, presence: true
end
