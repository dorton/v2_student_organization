class StudentsController < ApplicationController
  def import
    @cohort = current_user.cohorts.find(params[:cohort_id])
    if params[:file]
      Student.import(params[:file], @cohort, @cohort.city)
      redirect_to edit_cohort_path(@cohort)
    end
  end

  def new
    @cohort = current_user.cohorts.find(params[:cohort_id])
    @student = @cohort.students.new
  end

  def edit
    @cohort = current_user.cohorts.find(params[:cohort_id])
    @student = @cohort.students.find(params[:id])
  end

  def create
    @cohort = current_user.cohorts.find(params[:cohort_id])
    @student = @cohort.students.new(student_params)
    @student.city_id = @cohort.city.id

    if @student.save!
      redirect_to edit_cohort_path(@cohort), notice: 'student Created.'
    else
      render new_cohort_student_path(@cohort), notice: 'oooops.'
    end
  end

  def update
    @cohort = current_user.cohorts.find(params[:cohort_id])
    @student = @cohort.students.find(params[:id])

    if @student.update(student_params)
      redirect_to edit_cohort_path(@cohort), notice: "hizaugh!"
    else
      redirect_to edit_cohort_path(@cohort), notice: "oooops!"
    end
  end

  def destroy
    @cohort = current_user.cohorts.find(params[:cohort_id])

    @cohort.students.find(params[:id]).destroy
    redirect_to edit_cohort_path(@cohort), notice: "Demoed!"
  end

  private

  def student_params
    params.require(:student).permit(:last_name, :first_name, :email, :slack_username, :cohort_id, :city_id)
  end
end
