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
  
  test "should show new when create registration fails" do
    @registration.signup_reason_id = nil
    assert_difference('Registration.count', 0) do
      post :create, registration: @registration.attributes, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    end

    assert_template :new
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
  
  test "should show edit when update registration fails" do
    @registration.signup_reason_id = nil
    put :update, id: @registration, registration: @registration.attributes, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_template :edit
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    end

    assert_redirected_to department_course_section_registrations_path(@registration.section.course.department, @registration.section.course, @registration.section)
  end
  
  test "should create study group if one was not selected" do
    @registration.study_group_id = nil
    assert_difference('StudyGroup.count', 1) do
      put :update, id: @registration, registration: @registration.attributes, study_group: study_groups(:one).attributes, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    end
    
    assert_difference('StudyGroup.count', 1) do
      post :create, registration: @registration.attributes, study_group: study_groups(:one).attributes, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    end
  end
  
  test "registration fee equals section fee when user is not an admin" do
    @registration.section.registration_fee = 100
    @registration.section.save
    @registration.registration_fee = 50
    
    #signed in as admin here, so it should allow the change
    post :create, registration: @registration.attributes, study_group: study_groups(:one).attributes, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_equal 50, assigns(:registration).registration_fee
    
    sign_out(users(:admin))
    sign_in(users(:student))
    post :create, registration: @registration.attributes, study_group: study_groups(:one).attributes, department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_equal 100, assigns(:registration).registration_fee
  end
  
  test "registration fee reflects scholarship discount" do
    @registration.registration_fee = 100.0
    
    post :create, registration: @registration.attributes, scholarship_code:"percent", department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_equal 90.0, assigns(:registration).registration_fee
    
    post :create, registration: @registration.attributes, scholarship_code:"flatamount", department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_equal 85.0, assigns(:registration).registration_fee
    
    post :create, registration: @registration.attributes, scholarship_code:"smallpercent", department_id: @registration.section.course.department.id, course_id: @registration.section.course.id, section_id: @registration.section.id
    assert_equal 90.0, assigns(:registration).registration_fee
    
  end
  
end
