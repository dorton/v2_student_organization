class Activity < ApplicationRecord
  belongs_to :group
  has_many :days, through: :day_tivities
  has_many :day_tivities
end
