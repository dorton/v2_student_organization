class Student < ApplicationRecord
  belongs_to :cohort
  belongs_to :specialization
  belongs_to :group
  belongs_to :city
  has_many :groups, through: :student_groups
  has_many :student_groups

  def name
    "#{first_name} #{last_name}"
  end
end
