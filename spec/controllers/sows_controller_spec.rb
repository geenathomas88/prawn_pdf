require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SowsController do

  # This should return the minimal set of attributes required to create a valid
  # Sow. As you add validations to Sow, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SowsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all sows as @sows" do
      sow = Sow.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sows).should eq([sow])
    end
  end

  describe "GET show" do
    it "assigns the requested sow as @sow" do
      sow = Sow.create! valid_attributes
      get :show, {:id => sow.to_param}, valid_session
      assigns(:sow).should eq(sow)
    end
  end

  describe "GET new" do
    it "assigns a new sow as @sow" do
      get :new, {}, valid_session
      assigns(:sow).should be_a_new(Sow)
    end
  end

  describe "GET edit" do
    it "assigns the requested sow as @sow" do
      sow = Sow.create! valid_attributes
      get :edit, {:id => sow.to_param}, valid_session
      assigns(:sow).should eq(sow)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sow" do
        expect {
          post :create, {:sow => valid_attributes}, valid_session
        }.to change(Sow, :count).by(1)
      end

      it "assigns a newly created sow as @sow" do
        post :create, {:sow => valid_attributes}, valid_session
        assigns(:sow).should be_a(Sow)
        assigns(:sow).should be_persisted
      end

      it "redirects to the created sow" do
        post :create, {:sow => valid_attributes}, valid_session
        response.should redirect_to(Sow.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sow as @sow" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sow.any_instance.stub(:save).and_return(false)
        post :create, {:sow => { "name" => "invalid value" }}, valid_session
        assigns(:sow).should be_a_new(Sow)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sow.any_instance.stub(:save).and_return(false)
        post :create, {:sow => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sow" do
        sow = Sow.create! valid_attributes
        # Assuming there are no other sows in the database, this
        # specifies that the Sow created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sow.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => sow.to_param, :sow => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested sow as @sow" do
        sow = Sow.create! valid_attributes
        put :update, {:id => sow.to_param, :sow => valid_attributes}, valid_session
        assigns(:sow).should eq(sow)
      end

      it "redirects to the sow" do
        sow = Sow.create! valid_attributes
        put :update, {:id => sow.to_param, :sow => valid_attributes}, valid_session
        response.should redirect_to(sow)
      end
    end

    describe "with invalid params" do
      it "assigns the sow as @sow" do
        sow = Sow.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sow.any_instance.stub(:save).and_return(false)
        put :update, {:id => sow.to_param, :sow => { "name" => "invalid value" }}, valid_session
        assigns(:sow).should eq(sow)
      end

      it "re-renders the 'edit' template" do
        sow = Sow.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sow.any_instance.stub(:save).and_return(false)
        put :update, {:id => sow.to_param, :sow => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sow" do
      sow = Sow.create! valid_attributes
      expect {
        delete :destroy, {:id => sow.to_param}, valid_session
      }.to change(Sow, :count).by(-1)
    end

    it "redirects to the sows list" do
      sow = Sow.create! valid_attributes
      delete :destroy, {:id => sow.to_param}, valid_session
      response.should redirect_to(sows_url)
    end
  end

end
