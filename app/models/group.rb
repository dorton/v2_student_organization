class Group < ApplicationRecord
  belongs_to :day
  has_many :students
  belongs_to :user
end
