class GroupsController < ApplicationController

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @day = Day.find(params[:day_id])
    @group = @day.groups.new(day_params)
    @group.user_id = User.last.id

    if @group.save!
      redirect_to cohort_day_path(@cohort, @day), notice: "hizaugh!"
    else
      redirect_to cohort_day_path(@cohort, @day), notice: "oooops!"
    end

  end

    private

    def day_params
      params.require(:group).permit(:name)
    end
end
