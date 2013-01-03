require 'spec_helper'

describe ActivityStatus do
  	before(:each) do  		
		@activity_status = FactoryGirl.create(:activity_status)		
	end
	describe "Crud operations" do
		it "should create a new activity status" do
			@activity_status.should be_valid
			@activity_status.save.should be_true
		end
		it "should update an activity status" do							
			@activity_status.update_attributes(:name => "edited activity status")
			@activity_status.save.should be_true 
		end
		it "should delete an activity status" do
			@activity_status = FactoryGirl.build(:activity_status)
			@activity_status.destroy
			@activity_status.id.should eql(nil)
		end
	end
end
