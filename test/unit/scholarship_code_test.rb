require 'test_helper'

class ScholarshipCodeTest < ActiveSupport::TestCase
  setup do 
    @code = ScholarshipCode.new
  end
   
  test "value calculates flat amount correctly" do
    @code.discount_type = ScholarshipCode::DiscountTypes[:FLATAMOUNT][:id]
    @code.discount_amount = 15
    assert_equal 15, @code.value(100)
  end
  
  test "value calculates percentage greater than 1 discount amount correctly" do
    @code.discount_type = ScholarshipCode::DiscountTypes[:PERCENT][:id]
    @code.discount_amount = 20
    assert_equal 40, @code.value(200)
  end
  
  test "value calculates percentage less than 1 discount amount correctly" do
    @code.discount_type = ScholarshipCode::DiscountTypes[:PERCENT][:id]
    @code.discount_amount = 0.20
    assert_equal 40, @code.value(200)
  end
end
