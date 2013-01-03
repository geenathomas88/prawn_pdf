class AddColumnToTicket < ActiveRecord::Migration
  def change
    #add_column :tickets, :owner, :string
    add_column :tickets, :user_id, :integer
  end
end
