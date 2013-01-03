require 'spec_helper'

describe RolesController ,:type => :controller do

   before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @role = FactoryGirl.create(:role)
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
    it "should show the role" do
      get :show, {:id => @role.to_param}
      response.should be_success 
    end
  end

  describe 'edit' do
    it "should be successful" do
      get :edit, :id=>@role.id
      response.should be_success
    end
  end

  describe 'create' do
     it "should create a new role" do
      post :create    
      @role.should be_valid
    end

    it "should not create a role without rolename" do
      @role1 = Role.create(:id=>1,:name=>"")
      post :create
      @role1.should_not be_valid
    end
  end

  describe 'update' do
    it "should update role name" do
      put :update,  :id => @role.id
      @role.stub!(:update_attributes).and_return(true)
      response.should redirect_to(role_path(@role))
    end

    it "should not update role name with invalid params" do
      role = Role.create(:name=>"RoleA")      
      put :update, {:id => role.to_param, :role => { "name" => "" }}
      response.should render_template("edit")
    end 
  end

  describe 'destroy' do
    it "should delete the role" do
      role = Role.create(:name=>"role")
      expect {
        delete :destroy, {:id => role.to_param}
      }.to change(Role, :count).by(-1)
    end


     it "redirects to the roles list" do
      role = Role.create(:name=>"Role")
      delete :destroy, {:id => role.to_param}
      response.should redirect_to(roles_path)
    end
  end

end
