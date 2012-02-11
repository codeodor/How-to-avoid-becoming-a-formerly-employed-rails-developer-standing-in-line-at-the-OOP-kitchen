class ChangeDicountToDiscountInScholarshipCode < ActiveRecord::Migration
  def up
    rename_column :scholarship_codes, :dicount_amount, :discount_amount
  end

  def down
    rename_column :scholarship_codes, :discount_amount, :dicount_amount
  end
end
