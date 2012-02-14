class Department < ActiveRecord::Base
  has_many :courses
  has_many :resource_lists
  belongs_to :user
  
  has_many :sections, :through=>:courses
  has_many :registrations, :through=>:sections
  
  validates_presence_of :name
  
  def self.invoice_all(month, year)
    start_date = Time.new(year, month, 1)
    finish_date = start_date.end_of_month
    status = Registration::PaymentStatuses[:PAID][:id]
    
    self.all.each do |dept|
      paid_regs = dept.registrations.where(
          ["payment_status = #{status} and registrations.created_at between ? and ?", 
            start_date, finish_date]
        ).count
      
      unpaid_regs = dept.registrations.where(
          ["(payment_status is null or payment_status != #{status}) and registrations.created_at between ? and ?", 
            start_date, finish_date]
        ).count
      
      Invoice.create(
        department_id: dept.id, 
        paid_registrations: paid_regs, 
        unpaid_registrations: unpaid_regs, 
        invoice_date: finish_date, 
        invoice_amount: (paid_regs + unpaid_regs)*2
      )
    end
  end
  
end
