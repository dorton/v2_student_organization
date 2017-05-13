class CitiesController < ApplicationController
  def index

    @cohorts = current_user.cohorts.all
    @staff = current_user.city.users.all
  end
end
