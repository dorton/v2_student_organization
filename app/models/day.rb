class Day < ApplicationRecord
  belongs_to :cohort
  has_many :groups, dependent: :destroy
  belongs_to :city
  has_many :activities, through: :day_tivities
  has_many :day_tivities, dependent: :destroy
  validates :name, presence: true

  before_create do
    self.week_number = name.cweek
  end
end
