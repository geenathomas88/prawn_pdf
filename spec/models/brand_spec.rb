require 'spec_helper'

describe Brand do
  before(:each) do  		
		@brand = FactoryGirl.create(:brand)		
	end
	describe "Crud operations" do
		it "should create a new brand" do
			@brand.should be_valid
			@brand.save.should be_true
		end
		it "should update an brand" do							
			@brand.update_attributes(:name => "edited brand")
			@brand.save.should be_true 
		end
		it "should delete an brand" do
			@brand = FactoryGirl.build(:brand)
			@brand.destroy
			@brand.id.should eql(nil)
		end
	end
end
