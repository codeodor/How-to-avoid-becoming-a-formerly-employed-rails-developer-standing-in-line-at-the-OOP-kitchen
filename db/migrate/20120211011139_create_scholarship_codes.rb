class CreateScholarshipCodes < ActiveRecord::Migration
  def change
    create_table :scholarship_codes do |t|
      t.integer :department_id
      t.string :code
      t.integer :discount_type
      t.float :dicount_amount

      t.timestamps
    end
  end
end
