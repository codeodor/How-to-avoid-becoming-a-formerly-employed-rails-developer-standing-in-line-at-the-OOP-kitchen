require 'test_helper'

class DepartmentsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @department = departments(:math)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department" do
    assert_difference('Department.count') do
      post :create, department: @department.attributes
    end

    assert_redirected_to department_path(assigns(:department))
  end
  
  test "should show new when create department fails" do
    assert_difference('Department.count', 0) do
      @department.name = ""
      post :create, department: @department.attributes
    end

    assert_template :new
  end

  test "should show department" do
    get :show, id: @department
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department
    assert_response :success
  end

  test "should update department" do
    put :update, id: @department, department: @department.attributes
    assert_redirected_to department_path(assigns(:department))
  end

  test "should show edit when update department fails" do
    @department.name = ""
    put :update, id: @department, department: @department.attributes
    assert_template :edit
  end

  test "should destroy department" do
    assert_difference('Department.count', -1) do
      delete :destroy, id: @department
    end

    assert_redirected_to departments_path
  end
  
  
  test "should create invoices" do 
    original_count = Invoice.count
    post :create_invoices, :month=>3, :year=>2012
    new_count = Invoice.count
    assert original_count < new_count
  end
end
