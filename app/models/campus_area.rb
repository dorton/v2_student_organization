class CampusArea < ApplicationRecord
  belongs_to :city
  has_many :groups

  validates :name, presence: true
end
