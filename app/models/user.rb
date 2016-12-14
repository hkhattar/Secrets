class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret, dependent: :destroy
	validates :name,  presence:true
	validates :email, presence: true, uniqueness: true,format: {with: EMAIL_REGEX}
	 validates :email, uniqueness: { case_sensitive: false }
	 validates :password, :presence => true
end
