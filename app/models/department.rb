class Department < ActiveRecord::Base
  has_many :courses
  has_many :resource_lists
end
