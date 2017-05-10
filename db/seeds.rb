# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def create_specializations
  courses = ["JS", "Ruby", "Java"]
  courses.each do |course|
    Specialization.create(course: course)
  end
end

create_specializations

def create_cities
  campuses = ["Houston", "Austin", "Dallas"]

  campuses.each do |campus|
    city = City.create(name: campus)
    cohort = Cohort.create(start_date: "2017-5-22", end_date: "2017-9-2", course_name: "Web Development Career Path")
    city.cohorts << cohort

    5.times do
      user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8))
      city.users << user
      cohort.users << user
    end

    (15..30).to_a.sample.times do
      student = Student.create(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, specialization_id: Specialization.all.sample.id)
      city.students << student
      cohort.students << student
    end

  end
end

create_cities

def create_me
  me = User.new
  me.first_name = "Bob"
  me.last_name = "Lawblah"
  me.email = "123@123.com"
  me.password = "12345678"
  me.city_id = City.first.id
  me.save
  me.cohorts << Cohort.first
end

create_me

def create_days
  day = Day.new
  day.name = Date.today
  day.cohort_id = Cohort.first.id
  day.city_id = City.first.id
  day.save!
end

create_days
