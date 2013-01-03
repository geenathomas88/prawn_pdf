class AddJobRegionToTickets < ActiveRecord::Migration
  def change
  	add_column :tickets, :job_region_id, :integer
  end
end
