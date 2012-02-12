require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  test "should get new" do
    get :new, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, registration: @registration.attributes, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    end

    assert_redirected_to department_course_section_registration_path(assigns(:registration).section.course.department, assigns(:registration).section.course, assigns(:registration).section, assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_response :success
  end

  test "should update registration" do
    put :update, id: @registration, registration: @registration.attributes, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_redirected_to department_course_section_registration_path(assigns(:registration).section.course.department, assigns(:registration).section.course, assigns(:registration).section, assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    end

    assert_redirected_to department_course_section_registrations_path(@registration.section.course.department, @registration.section.course, @registration.section)
  end
end
