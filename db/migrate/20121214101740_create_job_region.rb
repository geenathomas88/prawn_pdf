class CreateJobRegion < ActiveRecord::Migration
  def up
  	create_table :job_regions do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
  	drop_table :job_regions do |t|
      t.string :name

      t.timestamps
    end
  end
end
