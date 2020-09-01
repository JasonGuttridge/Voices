class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :follows, dependent: :destroy
  has_many :messages, through: :follows
  validates :firstName, presence: true
  validates :lastName, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: {minimum: 8}, :on => :create
  before_save { self.email.downcase!}
end
