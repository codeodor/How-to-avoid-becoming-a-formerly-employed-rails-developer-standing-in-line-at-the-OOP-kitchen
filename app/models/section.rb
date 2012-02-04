class Section < ActiveRecord::Base
  belongs_to :course
  has_many :registrations
  
  class RegistrationStatuses < Enumeration
    self.add_item(:RESTRICTED, {:id => 0, :name => 'Restricted'})
    self.add_item(:OPEN, {:id => 1, :name => 'Open'})
    self.add_item(:NO_STUDY_GROUPS, {:id => 2, :name => 'No New Study Groups'})
    self.add_item(:CLOSED, {:id => 3, :name => 'Closed'})
    self.add_item(:INTEREST, {:id => 4, :name => 'Register Interest Only'})
  end
  
  
  def full_name
    "#{course.course_number} #{course.name} #{name}"
  end
end
