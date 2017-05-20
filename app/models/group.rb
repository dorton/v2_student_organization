class Group < ApplicationRecord
  belongs_to :day
  has_many :users, through: :user_groups
  has_many :user_groups, dependent: :destroy
  belongs_to :campus_area
  has_many :students, through: :student_groups
  has_many :student_groups, dependent: :destroy
  has_many :activities, through: :group_tivities
  has_many :group_tivities, dependent: :destroy

  amoeba do
    enable
    clone [:student_groups, :user_groups, :group_tivities]
  end


  def self.create_everyday_groups(day)
    activities = Activity.where(everyday: true)
    activities.each do |activity|
      group = day.groups.new
      group.add_all_students = true
      group.campus_area = CampusArea.find_by(name: "Main Room")
      if activity.name == "Morning Announcements"
        group.start_time = "09:30AM"
      elsif activity.name == "Lecture Review"
        group.start_time = "10:00AM"
      elsif activity.name == "Assessed Project"
        group.start_time = "1:00PM"
      elsif activity.name == "Open Lab"
        group.start_time = "2:00PM"
      elsif activity.name == "AI Assessment and Check In"
        group.start_time = "4:00PM"
      else
        group.start_time = "09:30AM"
      end
      group.save

      group.students << day.cohort.students unless activity.name == "Lecture Review"
      group.activities << activity

    end

  end

end
