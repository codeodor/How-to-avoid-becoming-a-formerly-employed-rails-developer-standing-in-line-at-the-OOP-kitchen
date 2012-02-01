require 'test_helper'

class SignupReasonsControllerTest < ActionController::TestCase
  setup do
    @signup_reason = signup_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signup_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signup_reason" do
    assert_difference('SignupReason.count') do
      post :create, signup_reason: @signup_reason.attributes
    end

    assert_redirected_to signup_reason_path(assigns(:signup_reason))
  end

  test "should show signup_reason" do
    get :show, id: @signup_reason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @signup_reason
    assert_response :success
  end

  test "should update signup_reason" do
    put :update, id: @signup_reason, signup_reason: @signup_reason.attributes
    assert_redirected_to signup_reason_path(assigns(:signup_reason))
  end

  test "should destroy signup_reason" do
    assert_difference('SignupReason.count', -1) do
      delete :destroy, id: @signup_reason
    end

    assert_redirected_to signup_reasons_path
  end
end
