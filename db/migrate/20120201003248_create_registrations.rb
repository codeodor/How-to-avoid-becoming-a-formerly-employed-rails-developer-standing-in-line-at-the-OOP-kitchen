class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :payment_status
      t.boolean :approved
      t.boolean :teaching_assistant
      t.float :registration_fee
      t.integer :user_id
      t.integer :section_id
      t.integer :study_group_id
      t.boolean :class_coordinator
      t.boolean :study_group_leader
      t.integer :signup_reason_id
      t.integer :scholarship_code_id

      t.timestamps
    end
  end
end
