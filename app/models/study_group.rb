class StudyGroup < ActiveRecord::Base
  belongs_to :section
  validates_presence_of :name
end
