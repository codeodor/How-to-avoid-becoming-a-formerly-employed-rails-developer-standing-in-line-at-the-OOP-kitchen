class CreateSignupReasons < ActiveRecord::Migration
  def change
    create_table :signup_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
