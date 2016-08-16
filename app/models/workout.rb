class Workout < ApplicationRecord
  has_many :sessions, dependent: :destroy
  belongs_to :user
end
