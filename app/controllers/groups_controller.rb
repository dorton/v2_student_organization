class GroupsController < ApplicationController

  def new
    @cohort = Cohort.find(params[:cohort_id])
    @day = Day.find(params[:day_id])
    @group = @day.groups.new
  end

  def edit
    @cohort = Cohort.find(params[:cohort_id])
    @day = @cohort.days.find(params[:day_id])
    @group = @day.groups.find(params[:id])

  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @day = Day.find(params[:day_id])
    @group = @day.groups.new(group_params)


    if @group.save!
      redirect_to cohort_day_path(@cohort, @day), notice: "hizaugh!"
    else
      redirect_to cohort_day_path(@cohort, @day), notice: "oooops!"
    end

  end

  def update
    @cohort = Cohort.find(params[:cohort_id])
    @day = @cohort.days.find(params[:day_id])
    @group = @day.groups.find(params[:id])

    if @group.update(group_params)
      redirect_to cohort_day_path(@cohort, @day), notice: "hizaugh!"
    else
      redirect_to cohort_day_path(@cohort, @day), notice: "oooops!"
    end
  end

  def destroy
    @cohort = Cohort.find(params[:cohort_id])
    @day = @cohort.days.find(params[:day_id])

    @day.groups.find(params[:id]).destroy
    redirect_to cohort_day_path(@cohort, @day), notice: "Demoed!"
  end

    private

    def group_params
      params.require(:group).permit(:name, :user_id, :start_time, :end_time, :description, :review, :activity_level, :one_on_one, :ai_session)
    end
end
