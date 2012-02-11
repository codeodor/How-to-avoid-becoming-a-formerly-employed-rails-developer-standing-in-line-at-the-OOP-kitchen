class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_authentication
  
  def check_authentication
    exempt_controllers = ["HomeController", "Devise::SessionsController"]
    exempt_actions = ['sections#show']
    authenticate_user! unless exempt_controllers.include?(self.class.name) || exempt_actions.include?("#{controller_name}##{action_name}")
  end
    
  
end
