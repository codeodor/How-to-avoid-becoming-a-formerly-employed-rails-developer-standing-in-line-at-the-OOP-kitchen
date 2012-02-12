require 'test_helper'

class EducationalResourcesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)
    @educational_resource = educational_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:educational_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create educational_resource" do
    assert_difference('EducationalResource.count') do
      post :create, educational_resource: @educational_resource.attributes
    end

    assert_redirected_to educational_resource_path(assigns(:educational_resource))
  end

  test "should show educational_resource" do
    get :show, id: @educational_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @educational_resource
    assert_response :success
  end

  test "should update educational_resource" do
    put :update, id: @educational_resource, educational_resource: @educational_resource.attributes
    assert_redirected_to educational_resource_path(assigns(:educational_resource))
  end

  test "should destroy educational_resource" do
    assert_difference('EducationalResource.count', -1) do
      delete :destroy, id: @educational_resource
    end

    assert_redirected_to educational_resources_path
  end
end
