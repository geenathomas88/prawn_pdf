class Ticket < ActiveRecord::Base
  attr_accessible :QA, :QA_end, :QA_start, :activity_id, :activity_status_id, :agency_review_close, :allocation, :brand_id, :change_type_id, :project_id, :client_id, :date, :deliver, :expected_deliver_date, :job_ticket_no, :ncn_raised_by, :ncn_start, :onsite_coordinator, :onsite_review_close, :prevalidation_end, :prevalidation_start,:priority_id,:product_id, :production, :production_complete, :production_end, :production_start, :quote_values, :schedular, :version, :user_id, :job_region_id
  belongs_to :activity
  belongs_to :activity_status
  belongs_to :brand
  belongs_to :category
  belongs_to :change_type
  belongs_to :client
  belongs_to :project
  belongs_to :priority
  belongs_to :product
  belongs_to :user
  belongs_to :job_region
  #validates_presence_of :client_id
end
