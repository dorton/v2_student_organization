class TheScheduler

  def self.send_slack(student, groups, day)
    stu_groups = groups.joins(:students).where('students.id = ?', student.id)

    stu_groups_array = []
    stu_groups.order(:start_time).each do |groupinfo|
      if groupinfo.activities.count > 1
        activity_name = "#{groupinfo.activities.count} Activities"
      else
        activity_name = groupinfo.activities.map(&:name).to_sentence
      end
      the_group = "- #{groupinfo.start_time. strftime('%I:%M')} | #{groupinfo.campus_area.name} | #{groupinfo.users.map(&:name).to_sentence} | #{activity_name}"
      stu_groups_array << the_group
    end

    if stu_groups.where(review: true).count > 1
    else
      review_invite = "There will also be #{day.groups.where(review: true).count} #{'review'.pluralize(day.groups.where(review: true).count)} today at #{day.groups.where(review: true).map { |a| a.start_time.strftime('%I:%M')}.join(', ')}, feel free to attend."
    end

    token = ENV['slack_token']
    channel = "@#{student.slack_username}"
    text = "Good Morning! \n\nHere's your schedule for #{day.name.strftime('%a, %e %b %Y')}: \n\n#{stu_groups_array.join("\n")} \n\n#{review_invite}"

    Slack.configure do |config|
      config.token = token
    end

    client = Slack::Web::Client.new
    client.auth_test

    client.chat_postMessage(channel: channel, text: text, as_user: true)
  end
end
