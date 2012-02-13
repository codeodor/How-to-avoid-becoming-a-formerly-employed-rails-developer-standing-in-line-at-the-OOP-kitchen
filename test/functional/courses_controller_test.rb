require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @course = courses(:algebra)
  end

  test "should get index" do
    get :index, department_id: @course.department.id
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new, department_id: @course.department.id
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: @course.attributes, department_id: @course.department.id
    end

    assert_redirected_to department_course_path(assigns(:course).department, assigns(:course))
  end
  
  test "should show new when create course fails" do
    assert_difference('Course.count', 0) do
      post :create, course: {name: "", department_id: @course.department.id}, department_id: @course.department.id
    end
    assert_template :new
  end

  test "should show course" do
    get :show, id: @course, department_id: @course.department.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course, department_id: @course.department.id
    assert_response :success
  end

  test "should update course" do
    put :update, id: @course, course: @course.attributes, department_id: @course.department.id
    assert_redirected_to department_course_path(assigns(:course).department, assigns(:course))
  end
  
  test "should show edit when update course fails" do
    @course.name = ""
    put :update, id: @course, course: @course.attributes, department_id: @course.department.id
    assert_template :edit
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course, department_id: @course.department.id
    end

    assert_redirected_to department_courses_path(@course.department)
  end
end
