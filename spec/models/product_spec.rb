require 'spec_helper'

describe Product do
  before(:each) do  		
		@product = FactoryGirl.create(:product)		
	end
	describe "Crud operations" do
		it "should create a new product" do
			@product.should be_valid
			@product.save.should be_true
		end
		it "should update an product" do							
			@product.update_attributes(:name => "edited product")
			@product.save.should be_true 
		end
		it "should delete an product" do
			@product = FactoryGirl.build(:product)
			@product.destroy
			@product.id.should eql(nil)
		end
	end
end
