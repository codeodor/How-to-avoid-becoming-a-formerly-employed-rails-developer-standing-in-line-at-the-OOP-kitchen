class ScholarshipCode < ActiveRecord::Base
  belongs_to :department
  validates_presence_of :code
  
  class DiscountTypes < Enumeration
    self.add_item(:PERCENT, {:id => 0, :name => 'Percent'})
    self.add_item(:FLATAMOUNT, {:id => 1, :name => 'Flat amount'})
  end
  
  def self.for_department_with_code(department, code)
    self.find_by_department_id_and_code(department.id, code) 
  end
  
  def value(original_price)
    result = self.discount_amount.to_f
    if self.discount_type == ScholarshipCode::DiscountTypes[:PERCENT][:id]
      if self.discount_amount > 1
        result = original_price * self.discount_amount / 100
      else
        result = original_price * self.discount_amount
      end
    end
    return result
  end
end
