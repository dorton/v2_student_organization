require 'test_helper'

class Api::StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_student = api_students(:one)
  end

  test "should get index" do
    get api_students_url
    assert_response :success
  end

  test "should get new" do
    get new_api_student_url
    assert_response :success
  end

  test "should create api_student" do
    assert_difference('Api::Student.count') do
      post api_students_url, params: { api_student: {  } }
    end

    assert_redirected_to api_student_url(Api::Student.last)
  end

  test "should show api_student" do
    get api_student_url(@api_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_student_url(@api_student)
    assert_response :success
  end

  test "should update api_student" do
    patch api_student_url(@api_student), params: { api_student: {  } }
    assert_redirected_to api_student_url(@api_student)
  end

  test "should destroy api_student" do
    assert_difference('Api::Student.count', -1) do
      delete api_student_url(@api_student)
    end

    assert_redirected_to api_students_url
  end
end
