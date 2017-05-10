class Student < ApplicationRecord
  belongs_to :cohort
  belongs_to :specialization
  belongs_to :group
  belongs_to :city

  def name
    "#{first_name} #{last_name}"
  end
end
