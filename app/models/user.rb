class User < ActiveRecord::Base
  has_many :adventures
  has_secure_password
  validates :username, :email, :full_name, :preferred_name, presence: true
  validates :email, uniqueness: true
end