class Day < ApplicationRecord
  belongs_to :cohort
  has_many :groups
  belongs_to :city
end
