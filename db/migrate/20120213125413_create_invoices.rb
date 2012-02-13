class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :department_id
      t.date :invoice_date
      t.date :paid_date
      t.float :invoice_amount
      t.integer :paid_registrations
      t.integer :unpaid_registrations

      t.timestamps
    end
  end
end
