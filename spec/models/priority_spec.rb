require 'spec_helper'

describe Priority do
  before(:each) do  		
		@priority = FactoryGirl.create(:priority)		
	end
	describe "Crud operations" do
		it "should create a new priority" do
			@priority.should be_valid
			@priority.save.should be_true
		end
		it "should update an priority" do							
			@priority.update_attributes(:name => "edited priority")
			@priority.save.should be_true 
		end
		it "should delete an priority" do
			@priority = FactoryGirl.build(:priority)
			@priority.destroy
			@priority.id.should eql(nil)
		end
	end
end
