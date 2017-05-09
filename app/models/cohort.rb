class Cohort < ApplicationRecord
  belongs_to :city
  has_many :students
  has_many :days
  has_many :users, through: :user_cohorts
  has_many :user_cohorts
end
