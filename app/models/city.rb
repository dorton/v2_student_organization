class City < ApplicationRecord
  has_many :cohorts
  has_many :users
  has_many :students
  has_many :days
end
