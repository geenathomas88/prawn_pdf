require 'spec_helper'

describe Role do
   	before(:each) do
  		@user = FactoryGirl.create(:user)
		@attr = {:name => "Role A"}
		@role = FactoryGirl.create(:role)		
	end
	describe "#CRUD operations on role" do
		it "should create a new role" do							
			@role.should be_valid 
			@role.save.should be_true 
		end

		it "should not create a new role with invalid params" do		
			@attr1 = {:name => ""}	
			@role1 = Role.new(@attr1) 				
			@role1.should_not be_valid 
			@role1.save.should_not be_true 
		end	

		it "should update the role" do
			@role.update_attributes(:name => "Group A")
			@role.save.should be_true
		end

		it "should not update the role with inavlid params" do
			@role.update_attributes(:name => "")
			@role.save.should_not be_true
		end		

		it "should delete the role" do		
			@role = FactoryGirl.build(:role)		
			@role.destroy			
			@role.id.should eql(nil)			
		end	

	end
end
