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

  def self.create_everyday_groups(day, advancement_students, review_students)
    activities = Activity.where(everyday: true)
    activities.each do |activity|
      group = day.groups.new

      group.campus_area = CampusArea.find_by(name: "Main Room")
      if activity.name == "Morning Announcements"
        group.start_time = "09:30AM"
        group.end_time = "09:45AM"
        group.add_all_students = true
      elsif activity.name == "Lecture Review"
        group.start_time = "09:45AM"
        group.end_time = "10:30AM"
        group.remediation = true
      elsif activity.name == "Assessed Project"
        group.start_time = "1:00PM"
        group.end_time = "1:30PM"
        group.add_all_students = true
      elsif activity.name == "Assessed Project - Review"
        group.start_time = "1:30PM"
        group.end_time = "2:00PM"
        group.add_all_students = true
      elsif activity.name == "Open Lab"
        group.start_time = "2:00PM"
        group.end_time = "4:00PM"
        group.add_all_students = true
      else
      end
      group.save

      group.activities << activity
      day.activities << activity
    end
    todays_activities = Activity.where(date: Date.today)

    self.today_groups(day, todays_activities)

    day.groups.each do |group|
      if group.remediation?
        review_students.map{|k,v| k}.each do |student|
          group.students << Student.where(first_name: student.split(' ').first).where(last_name: student.split(' ').last)
        end
      elsif group.advancement?
        advancement_students.map{|k,v| k}.each do |student|
          group.students << Student.where(first_name: student.split(' ').first).where(last_name: student.split(' ').last)
        end
      end
    end

  end

  def self.today_groups(day, todays_activities)
    ['advancement', 'remediation'].each do |group_type|
      group = day.groups.new
      group.campus_area = CampusArea.find_by(name: ["Jolly JavaScripts", "Rooooobie Room"].sample)
      group.advancement = true if group_type == 'advancement'
      group.remediation = true if group_type == 'remediation'
      group.start_time = "09:45AM" if group_type == 'advancement'
      group.start_time = "10:30AM" if group_type == 'remediation'
      group.end_time = "12:00PM"
      todays_activities.each do |a|
        group.activities << a
      end
      group.save
    end
  end






end
