class Api::StudentsController < API::ApiController
  before_action :doorkeeper_authorize!

  before_action :set_student, only: [:show, :update, :destroy]

  before_action do
    request.format = :json
  end

  def index
    @students = Student.where(id: current_student.id)
  end

  def show
  end

  # def create
  #   @student = Student.new(student_params)
  #   if @student.save
  #     render :show, status: :created, location: @student
  #   else
  #     render json: @student.errors, status: :unprocessable_entity
  #   end
  # end

  def update
    if @student.update(student_params)
      render :show, status: :ok, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @student.destroy
  #   format.json { head :no_content }
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find_by!(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.fetch(:api_student, {})
    end
end
