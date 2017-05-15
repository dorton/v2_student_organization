class StudentsController < ApplicationController
  def import
    @cohort = current_user.cohorts.find(params[:cohort_id])
    if params[:file]
      Student.import(params[:file], @cohort, @cohort.city)
      redirect_to edit_cohort_path(@cohort)
    end
  end
end
