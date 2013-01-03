require 'spec_helper'

describe Sow do
  before(:each) do  		
		@sow = FactoryGirl.create(:sow)		
	end
	describe "Crud operations" do
		it "should create a new sow" do
			@sow.should be_valid
			@sow.save.should be_true
		end
		it "should update an sow" do							
			@sow.update_attributes(:name => "edited sow", :sow_date => "2012-12-11 11:30:06")
			@sow.save.should be_true 
		end
		it "should delete an sow" do
			@sow = FactoryGirl.build(:sow)
			@sow.destroy
			@sow.id.should eql(nil)
		end
	end
end
