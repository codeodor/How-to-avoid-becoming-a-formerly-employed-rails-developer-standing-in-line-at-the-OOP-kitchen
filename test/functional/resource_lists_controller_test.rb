require 'test_helper'

class ResourceListsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @resource_list = resource_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_list" do
    assert_difference('ResourceList.count') do
      post :create, resource_list: @resource_list.attributes
    end

    assert_redirected_to resource_list_path(assigns(:resource_list))
  end

  test "should show resource_list" do
    get :show, id: @resource_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resource_list
    assert_response :success
  end

  test "should update resource_list" do
    put :update, id: @resource_list, resource_list: @resource_list.attributes
    assert_redirected_to resource_list_path(assigns(:resource_list))
  end

  test "should destroy resource_list" do
    assert_difference('ResourceList.count', -1) do
      delete :destroy, id: @resource_list
    end

    assert_redirected_to resource_lists_path
  end
end
