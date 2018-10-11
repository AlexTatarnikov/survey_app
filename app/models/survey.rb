class Survey < ApplicationRecord
  validates :title, :subtitle, presence: true
  validates :title, uniqueness: true
end
