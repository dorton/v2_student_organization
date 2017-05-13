class Day < ApplicationRecord
  belongs_to :cohort
  has_many :groups, dependent: :destroy
  belongs_to :city

  validates :name, presence: true
end
