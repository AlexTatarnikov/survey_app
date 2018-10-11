class Question < ApplicationRecord
  belongs_to :survey

  enum kind: [:number, :radio, :text, :checkbox, :rating]

  validates :title, presence: true
end
