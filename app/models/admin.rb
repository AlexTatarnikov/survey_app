class Admin < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A.+@.+\Z/ }

  def authentication_token
    @authentication_token ||= Knock::AuthToken.new(payload: { sub: id }).token
  end
end
