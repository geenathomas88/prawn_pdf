require 'spec_helper'

describe GroupsController,:type => :controller do

   #include Devise::TestHelpers
   before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @group = FactoryGirl.create(:group)
    end
   
   describe 'index' do
     it "should be successful" do
       get :index
       response.should be_success 
    end
  end  

   describe 'new' do
     it "should be successful" do
       get :new
       response.should be_success 
    end
  end    

  describe 'show' do
    it "should show the group" do
      get :show, {:id => @group.to_param}
      response.should be_success 
    end
  end

  describe 'edit' do
    it "should be successful" do
      get :edit, :id=>@group.id
      response.should be_success
    end
  end

  describe 'create' do
     it "should create a new group" do
      post :create    
      @group.should be_valid
    end

    it "should redirect to group" do
      @group = Group.create(:group_name=>"xx")
      puts @group.inspect
      post :create, {:group_name => "xxxx"}
      #response.should redirect_to group_path(@group)
    end

    it "should not create a group without groupname" do
      @group1 = Group.create(:id=>1,:group_name=>"")
      post :create
      @group1.should_not be_valid
    end
  end

  describe 'update' do
    it "should update group name" do
      put :update,  :id => @group.id
      @group.stub!(:update_attributes).and_return(true)
      response.should redirect_to(group_path(@group))
    end

    it "should not update group name with invalid params" do
      group = Group.create(:group_name=>"GroupA")      
      put :update, {:id => group.to_param, :group => { "group_name" => "" }}
      response.should render_template("edit")
    end 
  end

  describe 'destroy' do
    it "should delete the group" do
      group = Group.create(:group_name=>"Group")
      expect {
        delete :destroy, {:id => group.to_param}
      }.to change(Group, :count).by(-1)
    end

     it "redirects to the groups list" do
      group = Group.create(:group_name=>"Group")
      delete :destroy, {:id => group.to_param}
      response.should redirect_to(groups_path)
    end
  end
  describe "assign user to groups" do
    it "should create assign user to a group" do
      user1 = User.create(:associate_id => "1", :associate_name =>"user 1",:password =>"password1",:password_confirmation =>"password1" ,:email =>"abc@example.com" )
      user2 = User.create(:associate_id => "2", :associate_name =>"user 2",:password =>"password1",:password_confirmation =>"password1" ,:email =>"xyz@example.com" )
      group = Group.create(:group_name => "Group A")
      params = {:user_id =>user2.id, :group_id=>group.id}
      xhr :post, :create, params, :format => :js
      assigns(:group_user)["user_id"].should eq(user1.id)
      assigns(:group_user)["group_id"].should eq(group.id)
      assigns(:group_user).should_not be_nil
      response.should be_success
    end
  end

end