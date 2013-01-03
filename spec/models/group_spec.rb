require 'spec_helper'

describe Group do
  	before(:each) do
  		@user = FactoryGirl.create(:user)
		@attr = {:group_name => "Group A"}
		@group = FactoryGirl.create(:group)		
	end
	describe "#CRUD operations on group" do
		it "should create a new group" do							
			@group.should be_valid 
			@group.save.should be_true 
		end
		it "should update the group" do
			@group.update_attributes(:group_name => "Group A")
			@group.save.should be_true
		end

		it "should not create a new role with invalid params" do		
			@attr1 = {:group_name => ""}	
			@group1 = Group.new(@attr1) 				
			@group1.should_not be_valid 
			@group1.save.should_not be_true 
		end	

		it "should update the role" do
			@group.update_attributes(:group_name => "Group A")
			@group.save.should be_true
		end

		it "should delete the group" do		
			@group = FactoryGirl.build(:group)		
			@group.destroy			
			@group.id.should eql(nil)			
		end	
	end
end
