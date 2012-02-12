require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @section = sections(:MWF)
  end

  test "should get index" do
    get :index, department_id: @section.course.department.id, course_id: @section.course_id
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  test "should get new" do
    get :new, department_id: @section.course.department.id, course_id: @section.course_id
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post :create, section: @section.attributes
    end

    assert_redirected_to department_course_section_path(assigns(:section).course.department, assigns(:section).course, assigns(:section))
  end

  test "should show section" do
    get :show, id: @section, department_id: @section.course.department.id, course_id: @section.course_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section, department_id: @section.course.department.id, course_id: @section.course_id
    assert_response :success
  end

  test "should update section" do
    put :update, id: @section, section: @section.attributes
    assert_redirected_to department_course_section_path(assigns(:section).course.department, assigns(:section).course, assigns(:section))
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete :destroy, id: @section, department_id: @section.course.department.id, course_id: @section.course_id
    end

    assert_redirected_to department_course_sections_path(@section.course.department, @section.course)
  end
end
