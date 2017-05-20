class Group < ApplicationRecord
  belongs_to :day
  has_many :users, through: :user_groups
  has_many :user_groups
  belongs_to :campus_area
  has_many :students, through: :student_groups
  has_many :student_groups, dependent: :destroy
  has_many :activities

  amoeba do
    enable
    clone [:student_groups, :user_groups]
  end

end
