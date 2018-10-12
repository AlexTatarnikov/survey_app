class User < ApplicationRecord
  has_secure_password

  has_many :summaries, dependent: :delete_all

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A.+@.+\Z/ }
end
