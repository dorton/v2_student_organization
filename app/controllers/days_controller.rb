class DaysController < ApplicationController
  def index

  end

  def show
    @day = Day.find(params[:id])
  end


  def new
    @cohort = Cohort.find(params[:cohort_id])
    @day = @cohort.days.new
  end

  def edit
    @cohort = Cohort.find(params[:cohort_id])
    @day = @cohort.days.find(params[:id])
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @day = @cohort.days.new(day_params)
    @day.city_id = @cohort.city.id

    if @day.save!
      redirect_to @cohort, notice: 'Day Created.'
    else
      render @cohort, notice: 'oooops.'
    end
  end

  def update
    @cohort = Cohort.find(params[:cohort_id])
    @day = @cohort.days.find(params[:id])

    @day.update(day_params)
  end

  def destroy
    #code
  end

  private

  def day_params
    params.require(:day).permit(:name)
  end
end
