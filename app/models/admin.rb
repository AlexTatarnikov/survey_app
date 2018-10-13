class Admin < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A.+@.+\Z/ }
end
