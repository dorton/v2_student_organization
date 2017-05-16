class Student < ApplicationRecord
  require 'csv'

  belongs_to :cohort
  belongs_to :city
  has_many :groups, through: :student_groups
  has_many :student_groups, dependent: :destroy

  validates :email, uniqueness: true


  def self.import(file, cohort, city)
    CSV.foreach(file.path, headers: true) do |row|
      student = Student.new(row.to_hash)
      student.cohort_id = cohort.id
      student.city_id = city.id
      student.save!
    end
  end


  def name
    "#{first_name} #{last_name}"
  end


end
