class DashboardController < ApplicationController
  def index
    @city = current_user.city

    @days = @city.days.where(name: Date.today)

    @day_groups = []

    @days.each do |day|
      @day_groups << day.groups.all
    end

  end
end
