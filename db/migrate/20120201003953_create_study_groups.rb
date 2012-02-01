class CreateStudyGroups < ActiveRecord::Migration
  def change
    create_table :study_groups do |t|
      t.string :name
      t.integer :section_id
      t.boolean :official
      t.string :website
      t.integer :leader_id
      t.string :meeting_day
      t.integer :max_students
      t.integer :educational_resource_id

      t.timestamps
    end
  end
end
