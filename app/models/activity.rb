class Activity < ApplicationRecord
  has_many :groups, through: :group_tivities
  has_many :group_tivities, dependent: :destroy
  has_many :days, through: :day_tivities
  has_many :day_tivities, dependent: :destroy
end
