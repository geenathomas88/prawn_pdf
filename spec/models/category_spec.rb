require 'spec_helper'

describe Category do
  before(:each) do  		
		@category = FactoryGirl.create(:category)		
	end
	describe "Crud operations" do
		it "should create a new category" do
			@category.should be_valid
			@category.save.should be_true
		end
		it "should update an category" do							
			@category.update_attributes(:name => "edited category")
			@category.save.should be_true 
		end
		it "should delete an category" do
			@category = FactoryGirl.build(:category)
			@category.destroy
			@category.id.should eql(nil)
		end
	end
end
