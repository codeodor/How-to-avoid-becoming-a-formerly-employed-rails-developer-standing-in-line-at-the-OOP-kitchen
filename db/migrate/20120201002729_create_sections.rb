class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :course_id
      t.string :name
      t.text :description
      t.integer :registration_status
      t.date :start_date
      t.date :end_date
      t.float :registration_fee
      t.integer :class_length
      t.integer :max_students
      t.integer :study_group_size_for_official_status
      t.integer :max_study_group_size
      t.text :registration_message
      t.boolean :show_message
      t.integer :resource_list_id

      t.timestamps
    end
  end
end
