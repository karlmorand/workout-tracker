class User < ApplicationRecord
  validates :username, presence: true, uniqeness: true
  has_secure_password
  has_many :workouts
end
