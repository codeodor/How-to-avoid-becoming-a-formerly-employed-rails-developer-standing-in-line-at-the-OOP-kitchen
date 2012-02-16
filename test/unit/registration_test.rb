require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  setup do 
    @reg = Registration.new({:section_id=>sections(:MWF).id})
  end
  
  test "paid? is correct" do
    @reg.payment_status = Registration::PaymentStatuses[:UNPAID][:id]
    assert !@reg.paid?
    @reg.payment_status = Registration::PaymentStatuses[:PAID][:id]
    assert @reg.paid?
  end
end
