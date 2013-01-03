class RemovingColumnsInTables < ActiveRecord::Migration
  def up
  	remove_column :groups_users, :id
  	remove_column :users, :is_admin
  end


  def down
  	add_column :groups_users, :id, :integer
  	add_column :users, :is_admin, :boolean
  end
end