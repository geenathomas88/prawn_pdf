class AddDescriptionColumnToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :description, :string
  end
end
