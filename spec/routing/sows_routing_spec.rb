require "spec_helper"

describe SowsController do
  describe "routing" do

    it "routes to #index" do
      get("/sows").should route_to("sows#index")
    end

    it "routes to #new" do
      get("/sows/new").should route_to("sows#new")
    end

    it "routes to #show" do
      get("/sows/1").should route_to("sows#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sows/1/edit").should route_to("sows#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sows").should route_to("sows#create")
    end

    it "routes to #update" do
      put("/sows/1").should route_to("sows#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sows/1").should route_to("sows#destroy", :id => "1")
    end

  end
end
