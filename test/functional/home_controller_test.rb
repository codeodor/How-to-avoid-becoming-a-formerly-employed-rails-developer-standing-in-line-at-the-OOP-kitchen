require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "home page shows up when not logged in" do
    get :index
  end
    
end
