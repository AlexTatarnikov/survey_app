class User < ApplicationRecord
  has_secure_password

  has_many :responses, dependent: :delete_all

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A.+@.+\Z/ }

  def authentication_token
    @authentication_token ||= Knock::AuthToken.new(payload: { sub: id }).token
  end
end
