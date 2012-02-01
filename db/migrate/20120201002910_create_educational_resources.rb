class CreateEducationalResources < ActiveRecord::Migration
  def change
    create_table :educational_resources do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
