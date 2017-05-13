class CohortsController < ApplicationController



  def show
    @cohort = current_user.cohorts.find(params[:id])
    @days = @cohort.days.all
  end

  def new
    @cohort = current_user.city.cohorts.new
  end

  def edit
    @cohort = current_user.cohorts.find(params[:id])
  end

  def create
    @cohort = current_user.city.cohorts.new(cohort_params)

    @cohort.users << current_user.city.users

    if @cohort.save!
      redirect_to cohort_path(@cohort)
    else
      redirect_to new_cohort_path
    end
  end

  def update
    @cohort = current_user.cohorts.find(params[:id])

    if @cohort.update(cohort_params)
      redirect_to cohort_path(@cohort), notice: "hizaugh!"
    else
      redirect_to cohort_path(@cohort), notice: "oooops!"
    end
  end

  def destroy
    @cohort = current_user.cohorts.find(params[:id])

    @cohort.destroy
    redirect_to cities_path, notice: "Demoed!"
  end

  private

  def cohort_params
    params.require(:cohort).permit(:start_date, :end_date, :course_name )
  end
end
