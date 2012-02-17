class Registration < ActiveRecord::Base
  belongs_to :section
  belongs_to :study_group
  belongs_to :user
  belongs_to :signup_reason
  belongs_to :scholarship_code
  
  validates :user, :presence=>true
  validates_presence_of :signup_reason, :study_group
  
  class PaymentStatuses < Enumeration
    self.add_item(:UNPAID, {:id => 0, :name => 'Unpaid'})
    self.add_item(:PENDING, {:id => 1, :name => 'Pending'})
    self.add_item(:PAID, {:id => 2, :name => 'Paid'})
    self.add_item(:PARTIAL, {:id => 3, :name => 'Partially Paid'})
  end

  def paid?
    payment_status == PaymentStatuses[:PAID][:id]
  end
  
end
