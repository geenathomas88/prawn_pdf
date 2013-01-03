require 'spec_helper'

describe Activity do
   	before(:each) do  		
		@activity = FactoryGirl.create(:activity)		
	end
	describe "#CRUD operations on activity" do
		it "should create a new activity" do							
			@activity.should be_valid 
			@activity.save.should be_true 
		end
		it "should update an activity" do							
			@activity.update_attributes(:name => "edited activity")
			@activity.save.should be_true 
		end
		it "should delete an activity" do
			@activity = FactoryGirl.build(:activity)
			@activity.destroy
			@activity.id.should eql(nil)
		end
	end
end
