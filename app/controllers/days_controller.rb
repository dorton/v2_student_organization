class DaysController < ApplicationController
  def index

  end

  def show
    @day = Day.find(params[:id])
    @cohort = @day.cohort
    @users = @cohort.users

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

  def add_student_to_group
    @group = Group.find(params[:group_id])
    @student = Student.find(params[:student_id])
    @group.students << @student
    head :no_content
  end

  def remove_student_from_group
    @group = Group.find(params[:group_id])
    @student = Student.find(params[:student_id])

    @group.students.delete(@student)

  end


  private

  def day_params
    params.require(:day).permit(:name)
  end
end
