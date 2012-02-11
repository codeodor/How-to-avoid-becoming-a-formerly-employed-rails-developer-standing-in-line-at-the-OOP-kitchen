class HomeController < ApplicationController
  def index
    @sections_open_for_registration = Section.find(:all, :conditions=>['registration_status=?', Section::RegistrationStatuses[:OPEN][:id]])
    @current_sections = Section.find(:all, :conditions=>['? between start_date and end_date', Time.now])
  end
end
