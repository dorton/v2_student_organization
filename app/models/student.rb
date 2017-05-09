class Student < ApplicationRecord
  belongs_to :cohort
  belongs_to :specialization
  belongs_to :group
end
