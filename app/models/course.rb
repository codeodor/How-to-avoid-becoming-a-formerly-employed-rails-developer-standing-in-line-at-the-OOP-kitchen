class Course < ActiveRecord::Base
  belongs_to :department
  has_many :sections
  has_many :current_sections, :class_name=>'Section', :conditions=>["end_date > ?", Time.now]
  
  validates_format_of :website, :with => URI::regexp(%w(http https))
  
end
