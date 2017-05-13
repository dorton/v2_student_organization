class GroupsController < ApplicationController

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @day = Day.find(params[:day_id])
    @group = @day.groups.new(day_params)


    if @group.save!
      redirect_to cohort_day_path(@cohort, @day), notice: "hizaugh!"
    else
      redirect_to cohort_day_path(@cohort, @day), notice: "oooops!"
    end

  end

    private

    def day_params
      params.require(:group).permit(:name, :user_id, :start_time, :end_time, :description, :review, :activity_level, :one_on_one, :ai_session)
    end
end
