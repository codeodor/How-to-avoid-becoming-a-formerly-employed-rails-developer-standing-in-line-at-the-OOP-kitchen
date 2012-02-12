require 'test_helper'

class ScholarshipCodesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @scholarship_code = scholarship_codes(:one)
  end

  test "should get index" do
    get :index, department_id: @scholarship_code.department
    assert_response :success
    assert_not_nil assigns(:scholarship_codes)
  end

  test "should get new" do
    get :new, department_id: @scholarship_code.department
    assert_response :success
  end

  test "should create scholarship_code" do
    assert_difference('ScholarshipCode.count') do
      post :create, scholarship_code: @scholarship_code.attributes, department_id: @scholarship_code.department
    end

    assert_redirected_to department_scholarship_code_path(@scholarship_code.department, assigns(:scholarship_code))
  end

  test "should show scholarship_code" do
    get :show, id: @scholarship_code, department_id: @scholarship_code.department
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scholarship_code, department_id: @scholarship_code.department
    assert_response :success
  end

  test "should update scholarship_code" do
    put :update, id: @scholarship_code, scholarship_code: @scholarship_code.attributes, department_id: @scholarship_code.department
    assert_redirected_to department_scholarship_code_path(@scholarship_code.department, assigns(:scholarship_code))
  end

  test "should destroy scholarship_code" do
    assert_difference('ScholarshipCode.count', -1) do
      delete :destroy, id: @scholarship_code, department_id: @scholarship_code.department
    end

    assert_redirected_to department_scholarship_codes_path(@scholarship_code.department)
  end
end
