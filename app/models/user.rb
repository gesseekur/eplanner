class User < ActiveRecord::Base
  has_many :attends, dependent: :destroy
  has_many :events, through: :attends 
  has_many :comments, dependent: :destroy

  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name,:last_name, :city, :state, :presence => true 
  validates :password, :password_confirmation, length: { minimum: 8}, :presence => true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
