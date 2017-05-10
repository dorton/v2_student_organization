class CitiesController < ApplicationController
  def index
    @user = current_user
    @cohorts = @user.city.cohorts.all
  end
end
