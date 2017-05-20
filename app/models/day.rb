class Day < ApplicationRecord
  belongs_to :cohort
  has_many :groups, dependent: :destroy
  belongs_to :city
  has_many :activities
  validates :name, presence: true
end
