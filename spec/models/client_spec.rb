require 'spec_helper'

describe Client do
    before(:each) do  		
		@client = FactoryGirl.create(:client)		
	end
	describe "Crud operations" do
		it "should create a new client" do
			@client.should be_valid
			@client.save.should be_true
		end
		it "should update an client" do							
			@client.update_attributes(:client_name => "edited client", :client_contact => "1/1234, my street, new nagar")
			@client.save.should be_true 
		end
		it "should delete an client" do
			@client = FactoryGirl.build(:client)
			@client.destroy
			@client.id.should eql(nil)
		end
	end
end
