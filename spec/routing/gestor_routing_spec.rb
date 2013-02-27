require "spec_helper"

describe GestorController do
  describe "routing" do

    it "routes to #index" do
      get("/gestor").should route_to("gestor#index")
    end

    it "routes to #new" do
      get("/gestor/new").should route_to("gestor#new")
    end

    it "routes to #show" do
      get("/gestor/1").should route_to("gestor#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gestor/1/edit").should route_to("gestor#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gestor").should route_to("gestor#create")
    end

    it "routes to #update" do
      put("/gestor/1").should route_to("gestor#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gestor/1").should route_to("gestor#destroy", :id => "1")
    end

  end
end
