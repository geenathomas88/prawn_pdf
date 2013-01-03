class CreateSows < ActiveRecord::Migration
  def change
    create_table :sows do |t|
      t.string :name
      t.datetime :sow_date

      t.timestamps
    end
  end
end
