class AddResourceListIdToEducationalResource < ActiveRecord::Migration
  def change
    add_column :educational_resources, :resource_list_id, :integer

  end
end
