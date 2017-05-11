class CohortsController < ApplicationController
  def show
    @cohort = Cohort.find(params[:id])
    @days = @cohort.days.all
  end
end
