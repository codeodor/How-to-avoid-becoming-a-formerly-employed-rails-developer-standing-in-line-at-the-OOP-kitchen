class Course < ActiveRecord::Base
  belongs_to :department
  
  validates_format_of :website, :with => URI::regexp(%w(http https))
  
end
