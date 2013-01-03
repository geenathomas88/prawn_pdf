class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      #t.date :date
      t.string :job_ticket_no,:default => 1000
      t.integer :client_id
      t.integer :project_id
      t.integer :brand_id
      t.integer :product_id
      t.integer :activity_id
      t.integer :change_type_id
      t.integer :activity_status_id
      t.string :version
      t.integer :priority_id
      t.date :expected_deliver_date
      t.string :quote_values
      t.string :ncn_raised_by
      t.string :onsite_coordinator
      t.date :schedular
      t.date :prevalidation_start
      t.date :prevalidation_end
      t.date :allocation
      t.string :production
      t.date :production_start
      t.date :production_end
      t.string :QA
      t.date :QA_start
      t.date :QA_end
      t.date :ncn_start
      t.date :production_complete
      t.string :onsite_review_close
      t.string :agency_review_close
      t.string :deliver

      t.timestamps
    end
  end
end
