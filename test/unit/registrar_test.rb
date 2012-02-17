require 'test_helper'

class RegistrarTest < ActiveSupport::TestCase
  def setup 
    @registrar = Registrar.new
  end
  
  def test_registers_student_for_section
    student = User.new
    section = Section.new
    registration_info = {:section_id=>sections(:MWF).id}
    group_info = {}
    scholarship = ""
    registration = @registrar.register(student, registration_info, group_info, scholarship)
    assert_equal registration.user, student
  end
  
  
end