require "spec_helper"

describe ChangeTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/change_types").should route_to("change_types#index")
    end

    it "routes to #new" do
      get("/change_types/new").should route_to("change_types#new")
    end

    it "routes to #show" do
      get("/change_types/1").should route_to("change_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/change_types/1/edit").should route_to("change_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/change_types").should route_to("change_types#create")
    end

    it "routes to #update" do
      put("/change_types/1").should route_to("change_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/change_types/1").should route_to("change_types#destroy", :id => "1")
    end

  end
end
