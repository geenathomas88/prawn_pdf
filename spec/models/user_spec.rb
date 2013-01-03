require 'spec_helper'

describe User do
	
	before(:each) do
		@attr = {:associate_id => "ex1234", :associate_name => "example", :email => "example@example.com", :password => "password", :password_confirmation => "password"}
		@user = FactoryGirl.create(:user)
	end
	
	describe "#CRUD operations on user and check for validity and uniquness of the input" do
    	it "should create a new user given a valid attribute" do			
			@user = User.new(@attr) 
			@user.should be_valid #=> new will let you know if its valid or not
			@user.save.should be_true #=> another possible assertion to pass/fail the test
		end

		it "destroy the user" do
			@user = User.new(@attr) 					
			@user.destroy
			@user.id.should eql(nil)#=> new will let you know if its valid or not
		end

		it "update the user" do
			@user = User.new(@attr) 					
			@user.update_attributes(:associate_name => "new")
			@user.save.should be_true #=> new will let you know if its valid or not
		end

		it "should require an email" do
			@attr1 = {:associate_id => 11, :associate_name => 22, :email => "", :password => 123465, :password_confirmation => 123465}	
			@user1 = User.new(@attr1) 
			@user1.should_not be_valid #=> new will let you know if its valid or not
			@user1.save.should_not be_true #=> another possible assertion to pass/fail the test
		end

		it "should require a password" do
			@attr1 = {:associate_id => 11, :associate_name => 22, :email => "example@example.com", :password =>"", :password_confirmation => ""}	
			@user1 = User.new(@attr1) 
			@user1.should_not be_valid #=> new will let you know if its valid or not
			@user1.save.should_not be_true #=> another possible assertion to pass/fail the test
		end

		it "should require an associate id" do
			@attr1 = {:associate_id => "", :associate_name => 22, :email => "example@example.com", :password =>"password", :password_confirmation => "password"}	
			@user1 = User.new(@attr1) 
			@user1.should_not be_valid #=> new will let you know if its valid or not
			@user1.save.should_not be_true #=> another possible assertion to pass/fail the test
		end

		it "should require an associate name" do
			@attr1 = {:associate_id => "12345", :associate_name => "", :email => "example@example.com", :password =>"password", :password_confirmation => "password"}	
			@user1 = User.new(@attr1) 
			@user1.should_not be_valid #=> new will let you know if its valid or not
			@user1.save.should_not be_true #=> another possible assertion to pass/fail the test
		end

		it "should require a valid email" do
			@attr1 = {:associate_id => 11, :associate_name => 22, :email => "example", :password => 123465, :password_confirmation => 123465}	
			@user1 = User.new(@attr1) 
			@user1.should_not be_valid #=> new will let you know if its valid or not
			@user1.save.should_not be_true #=> another possible assertion to pass/fail the test
		end

		it "should require a unique email" do
			@attr1 = {:associate_id => 11, :associate_name => 22, :email => "example@example.com", :password => 123465, :password_confirmation => 123465}	
			@user1 = User.create(@attr1) 
			@user1.should be_valid
			@user1.should be_true
			@user2 = User.new(@attr1)
			@user2.should_not be_valid #=> new will let you know if its valid or not
			@user2.save.should_not be_true #=> another possible assertion to pass/fail the test
		end

		it "should reject short password" do
			@attr1 = {:associate_id => "ex1234", :associate_name => 22, :email => "example", :password => 123465, :password_confirmation => 123465}	
			@user1 = User.new(@attr1) 
			@user1.should_not be_valid #=> new will let you know if its valid or not
			@user1.save.should_not be_true #=> another possible assertion to pass/fail the test
		end

		it "should reject email addresses identical up to case" do
		    upcased_email = @attr[:email].upcase
		    User.create!(@attr.merge(:email => upcased_email))
		    user_with_duplicate_email = User.new(@attr)
		    user_with_duplicate_email.should_not be_valid
		 end
	end

	describe "password encryption" do

	    it "should have an encrypted password attribute" do
	      @user.should respond_to(:encrypted_password)
	    end

	    it "should set the encrypted password attribute" do
	      @user.encrypted_password.should_not be_blank
	    end
  end

end