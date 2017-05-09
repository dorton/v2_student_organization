class Day < ApplicationRecord
  belongs_to :cohort
  has_many :groups
end
