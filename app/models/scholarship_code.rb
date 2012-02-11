class ScholarshipCode < ActiveRecord::Base
  belongs_to :department
  
  class DiscountTypes < Enumeration
    self.add_item(:PERCENT, {:id => 0, :name => 'Percent'})
    self.add_item(:FLATAMOUNT, {:id => 1, :name => 'Flat amount'})
  end
end
