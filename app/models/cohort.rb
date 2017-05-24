class Cohort < ApplicationRecord
  belongs_to :city
  has_many :students, dependent: :destroy
  has_many :days, dependent: :destroy
  has_many :users, through: :user_cohorts
  has_many :user_cohorts, dependent: :destroy

  validates :start_date, :end_date, presence: true
end
