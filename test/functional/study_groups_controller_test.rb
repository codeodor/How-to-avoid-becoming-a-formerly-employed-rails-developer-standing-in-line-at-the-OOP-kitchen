require 'test_helper'

class StudyGroupsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @study_group = study_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_group" do
    assert_difference('StudyGroup.count') do
      post :create, study_group: @study_group.attributes
    end

    assert_redirected_to study_group_path(assigns(:study_group))
  end

  test "should show study_group" do
    get :show, id: @study_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_group
    assert_response :success
  end

  test "should update study_group" do
    put :update, id: @study_group, study_group: @study_group.attributes
    assert_redirected_to study_group_path(assigns(:study_group))
  end

  test "should destroy study_group" do
    assert_difference('StudyGroup.count', -1) do
      delete :destroy, id: @study_group
    end

    assert_redirected_to study_groups_path
  end
end
