class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :department_id
      t.string :name
      t.string :course_number
      t.text :description
      t.string :website

      t.timestamps
    end
  end
end
