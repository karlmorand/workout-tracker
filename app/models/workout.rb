class Workout < ApplicationRecord
  has_many :sessions, dependent: :destroy
end
