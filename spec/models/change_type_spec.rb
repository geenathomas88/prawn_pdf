require 'spec_helper'

describe ChangeType do
    before(:each) do  		
		@change_type = FactoryGirl.create(:change_type)		
	end
	describe "Crud operations" do
		it "should create a new change_type" do
			@change_type.should be_valid
			@change_type.save.should be_true
		end
		it "should update an change_type" do							
			@change_type.update_attributes(:name => "edited change_type")
			@change_type.save.should be_true 
		end
		it "should delete an change_type" do
			@change_type = FactoryGirl.build(:change_type)
			@change_type.destroy
			@change_type.id.should eql(nil)
		end
	end
end
