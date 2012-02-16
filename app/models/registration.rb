class Registration < ActiveRecord::Base
  def initialize(attrs=nil, user=nil, study_group_attrs=nil, scholarship=nil)
    super(attrs)
    
    unless user && user.admin?
      self.registration_fee = self.section.registration_fee 
      self.user = user
    end
    
    if study_group_attrs && !self.study_group_id
      new_group = StudyGroup.create(study_group_attrs)
      self.study_group = new_group if new_group.valid?
    end
    
    if scholarship
      code = ScholarshipCode.find_by_department_id_and_code(self.section.course.department, scholarship)
      if code
        if code.discount_type == ScholarshipCode::DiscountTypes[:PERCENT][:id]
          if code.discount_amount > 1
            discount = self.registration_fee * code.discount_amount / 100
          else
            discount = self.registration_fee * code.discount_amount
          end
        else
          discount = code.discount_amount
        end
        self.registration_fee -= discount
        self.scholarship_code = code
      end
    end    
  end
  
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
