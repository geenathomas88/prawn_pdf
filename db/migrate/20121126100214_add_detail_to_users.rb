class AddDetailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :associate_id, :string,:null => false, :default => ""
    add_column :users, :associate_name, :string,:null => false, :default => ""
  end
end
