require 'rubygems'
require 'factory_girl'

FactoryGirl.define  do |f|
  factory :user do |f|
	f.email              	"test@example.com"
	f.password           	"password1"
	f.password_confirmation "password1"	
	f.associate_id 			"12"
	f.associate_name 		"testing"
  end
  factory :group do |f|
	f.group_name            "new group"
  end  
  factory :role do |f|
	f.name            		"new role"
  end 
  factory :activity do |f|
	f.name            		"new activity"
  end   
  factory :activity_status do |f|
	f.name            		"new activity status"
  end 
  factory :brand do |f|
	f.name            		"new brand"
  end   
  factory :category do |f|
	f.name            		"new category"
  end 
  factory :change_type do |f|
	f.name            		"new change type"
  end 
  factory :client do |f|
	f.client_name           "damp"
	f.client_contact		"No:1/123, abc street, xyz nagar" 
  end  
  factory :priority do |f|
	f.name            		"new priority"
  end 
  factory :product do |f|
	f.name            		"new product"
  end 
  factory :sow do |f|
	f.name            		"sow 1"
	f.sow_date           	"2012-12-12 11:30:06"
  end
  factory :job_regiion do |f|
  f.name              "North America"
  end
  
  factory :project do |f|
  f.name              "Damp"
  end


  factory :ticket do |f|
  f.job_ticket_no              "10001"
  f.client_id                   2
  f.project_id                  3
  f.brand_id                    1
  f.product_id                  1    
  f.activity_id                 1 
  f.change_type_id              1
  f.activity_status_id          1
  f.priority_id                  1
  f.expected_deliver_date       "2012-01-31"
  f.quote_values                 "$23"
  f.user_id                      1
  f.created_at                    "2012-12-14 11:08:28"
  f.job_region_id                1
  end
end
