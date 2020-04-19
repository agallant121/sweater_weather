class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
  has_secure_token :auth_token

  def api_key
    auth_token
  end
end
