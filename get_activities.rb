require 'mechanize'
require 'pry'


    $email = ENV["email"]
    $password = ENV["newline_password"]
    $cohort_url = ENV["activity_url"]

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



        lessons = []


        a.get($cohort_url) do |page|
          page.search(".eo .scheduler-card").each do |card|
            dt = card.search("dt").first
            lesson_type = dt.search("span").text
            next unless dt.next_element
            lesson_name = dt.next_element.text.strip
            lessons << {type: lesson_type, name: lesson_name}
          end
        end

        return lessons
      end

    end

    results = all_count

    results.select{|card| card[:type] == "Activity"}.each do |k,v|
      puts [k, v].join
    end
