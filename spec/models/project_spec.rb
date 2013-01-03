require 'spec_helper'

describe Project do
  before(:each) do  		
		@project = FactoryGirl.create(:project)		
	end
	describe "Crud operations" do
		it "should create a new project" do
			@project.should be_valid
			@project.save.should be_true
		end
		it "should update an project" do							
			@project.update_attributes(:name => "edited project")
			@project.save.should be_true 
		end
		it "should delete an project" do
			@project = FactoryGirl.build(:project)
			@project.destroy
			@project.id.should eql(nil)
		end
	end
end
