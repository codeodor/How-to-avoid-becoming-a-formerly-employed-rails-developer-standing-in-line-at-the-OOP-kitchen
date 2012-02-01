class CreateResourceLists < ActiveRecord::Migration
  def change
    create_table :resource_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
