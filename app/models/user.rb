class User < ApplicationRecord
  belongs_to :city
  has_many :groups
  has_many :cohorts, through: :user_cohorts
  has_many :user_cohorts
end
