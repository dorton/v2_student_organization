class API::ApiController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
    @current_student = Student.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def current_student
    @current_student
  end
  helper_method :current_student

end
