class Survey < ApplicationRecord
  has_many :questions, dependent: :delete_all

  validates :title, :subtitle, presence: true
  validates :title, uniqueness: true

  accepts_nested_attributes_for :questions
end
