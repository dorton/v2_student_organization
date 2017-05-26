namespace :daily do
  desc "scrapes newline daily and grabs formal percentages"
  task formal_percentage: :environment do

    $email = ENV["email"]
    $password = ENV["newline_password"]
    $cohort_url = ENV["newline_url"]
    def all_count

      a = Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac Safari'
      }

      a.get($cohort_url) do |sign_in_page|

        # sign in here
        new_page = sign_in_page.form_with(id: "new_user") do |sign_in_form|
          sign_in_form.field_with(id: "user_email").value = $email
          sign_in_form.field_with(id: "user_password").value = $password
        end.submit


        people = {}

        a.get($cohort_url) do |page|
          # binding.pry
          page.search("#stats .objective-card").each do |card|
            name = card.search(".col").first.children.last.text.strip
            percent = card.search("h5").first.text
            people[name] = percent
          end
        end

        return people
      end

    end
    results = all_count
    advancement_students = results.select{|k,v| v.to_i > 75}
    review_students = results.select{|k,v| v.to_i <= 75}

    cohort = Cohort.last
    day = cohort.days.find_or_create_by(name: Date.today)

    Group.create_everyday_groups(day, advancement_students, review_students)


  end

    task attendance: :environment do

      users = User.all.map { |a| a.name }
      students = Student.all.map { |e| e.name }
      assignments = students.shuffle.in_groups(users.count, false)
      array = users.zip(assignments)
      h = {}
      array.each do |a|
        h[a[0]] = a[1]
      end


      token = ENV['slack_token']

      h.each do |k, v|

        u = User.find_by(last_name: k.split(' ').last)

        channel = "@#{u.slack_username}"

        text = "Oh, hi #{u.first_name}. \n\nHere's your attendance check for #{Date.today.strftime('%a, %e %b %Y')}: \n\n#{v.join("\n")}\n\nYou can mark your peeps here, https://newline.theironyard.com/admin/cohorts/8/attendance"


        Slack.configure do |config|
          config.token = token
        end

        client = Slack::Web::Client.new
        client.auth_test

        client.chat_postMessage(channel: channel, text: text, as_user: true) if u.slack_username.present?

      end

    end

end
