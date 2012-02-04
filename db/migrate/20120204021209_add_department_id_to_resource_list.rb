class AddDepartmentIdToResourceList < ActiveRecord::Migration
  def change
    add_column :resource_lists, :department_id, :integer

  end
end
