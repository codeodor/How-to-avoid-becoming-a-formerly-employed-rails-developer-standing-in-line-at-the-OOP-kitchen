require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  setup do 
    @reg = Registration.new
  end
  
  test "paid? is correct" do
    @reg.payment_status = Registration::PaymentStatuses[:UNPAID][:id]
    assert_false @reg.paid?
    @reg.payment_status = Registration::PaymentStatuses[:PAID][:id]
    assert @reg.paid?
  end
end
