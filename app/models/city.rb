class City < ApplicationRecord
  has_many :cohorts
  has_many :users
end
