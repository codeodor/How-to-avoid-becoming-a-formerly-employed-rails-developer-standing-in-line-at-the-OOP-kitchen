class EducationalResource < ActiveRecord::Base
  belongs_to :resource_list
  validates_presence_of :name
end
