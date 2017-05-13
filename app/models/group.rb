class Group < ApplicationRecord
  belongs_to :day
  belongs_to :user
  belongs_to :campus_area
  has_many :students, through: :student_groups
  has_many :student_groups, dependent: :destroy

end
