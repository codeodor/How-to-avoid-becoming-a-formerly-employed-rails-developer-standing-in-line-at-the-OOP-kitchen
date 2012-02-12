require 'test_helper'

class StudyGroupsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @study_group = study_groups(:one)
  end

  test "should get index" do
    get :index, department_id: @study_group.section.course.department.id, course_id: @study_group.section.course_id, section_id: @study_group.section_id
    assert_response :success
    assert_not_nil assigns(:study_groups)
  end

  test "should get new" do
    get :new, department_id: @study_group.section.course.department.id, course_id: @study_group.section.course_id, section_id: @study_group.section_id
    assert_response :success
  end

  test "should create study_group" do
    assert_difference('StudyGroup.count') do
      post :create, study_group: @study_group.attributes, department_id: @study_group.section.course.department.id, course_id: @study_group.section.course_id, section_id: @study_group.section_id
    end

    assert_redirected_to department_course_section_study_group_path(assigns(:study_group).section.course.department, assigns(:study_group).section.course, assigns(:study_group).section, assigns(:study_group))
  end

  test "should show study_group" do
    get :show, id: @study_group, department_id: @study_group.section.course.department.id, course_id: @study_group.section.course_id, section_id: @study_group.section_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_group, department_id: @study_group.section.course.department.id, course_id: @study_group.section.course_id, section_id: @study_group.section_id
    assert_response :success
  end

  test "should update study_group" do
    put :update, id: @study_group, study_group: @study_group.attributes, department_id: @study_group.section.course.department.id, course_id: @study_group.section.course_id, section_id: @study_group.section_id
    assert_redirected_to department_course_section_study_group_path(assigns(:study_group).section.course.department, assigns(:study_group).section.course, assigns(:study_group).section, assigns(:study_group))
  end

  test "should destroy study_group" do
    assert_difference('StudyGroup.count', -1) do
      delete :destroy, id: @study_group, department_id: @study_group.section.course.department.id, course_id: @study_group.section.course_id, section_id: @study_group.section_id
    end

    assert_redirected_to department_course_section_study_groups_path(@study_group.section.course.department, @study_group.section.course, @study_group.section)
  end
end
