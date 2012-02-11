require 'test_helper'

class ScholarshipCodesControllerTest < ActionController::TestCase
  setup do
    @scholarship_code = scholarship_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scholarship_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scholarship_code" do
    assert_difference('ScholarshipCode.count') do
      post :create, scholarship_code: @scholarship_code.attributes
    end

    assert_redirected_to scholarship_code_path(assigns(:scholarship_code))
  end

  test "should show scholarship_code" do
    get :show, id: @scholarship_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scholarship_code
    assert_response :success
  end

  test "should update scholarship_code" do
    put :update, id: @scholarship_code, scholarship_code: @scholarship_code.attributes
    assert_redirected_to scholarship_code_path(assigns(:scholarship_code))
  end

  test "should destroy scholarship_code" do
    assert_difference('ScholarshipCode.count', -1) do
      delete :destroy, id: @scholarship_code
    end

    assert_redirected_to scholarship_codes_path
  end
end
