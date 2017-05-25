class CitiesController < ApplicationController
  def index
    @cities = City.all

  end

  def show
    @cohorts = current_user.cohorts.all.uniq
    @staff = current_user.city.users.all
    @areas = current_user.city.campus_areas.all
  end
end
