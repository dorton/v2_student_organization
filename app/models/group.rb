class Group < ApplicationRecord
  belongs_to :day
  has_many :users, through: :user_groups
  has_many :user_groups
  belongs_to :campus_area
  has_many :students, through: :student_groups
  has_many :student_groups, dependent: :destroy
  has_many :activities, through: :group_tivities
  has_many :group_tivities, dependent: :destroy

  amoeba do
    enable
    clone [:student_groups, :user_groups, :group_tivities]
  end

end
