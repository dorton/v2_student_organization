json.extract! student, :id, :name, :email, :slack_username
json.cohort student.cohort.start_date
json.url api_student_url(student, format: :json)
