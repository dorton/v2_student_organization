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
    advancement_students = results.select{|k,v| v > "75"}
    review_students = results.select{|k,v| v <= "75"}
    cohort = Cohort.last
    day = cohort.days.find_or_create_by(name: Date.today)

    Group.create_everyday_groups(day, advancement_students, review_students)


  end

end
