require "spec_helper"

describe ActivityStatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/activity_statuses").should route_to("activity_statuses#index")
    end

    it "routes to #new" do
      get("/activity_statuses/new").should route_to("activity_statuses#new")
    end

    it "routes to #show" do
      get("/activity_statuses/1").should route_to("activity_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/activity_statuses/1/edit").should route_to("activity_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/activity_statuses").should route_to("activity_statuses#create")
    end

    it "routes to #update" do
      put("/activity_statuses/1").should route_to("activity_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/activity_statuses/1").should route_to("activity_statuses#destroy", :id => "1")
    end

  end
end
