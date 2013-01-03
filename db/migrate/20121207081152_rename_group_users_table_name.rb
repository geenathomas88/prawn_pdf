class RenameGroupUsersTableName < ActiveRecord::Migration
  def up
  	rename_table :group_users, :groups_users
  end

  def down
  	rename_table :groups_users, :group_users
  end
end
