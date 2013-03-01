require "spec_helper"

describe AdminInstituicaosController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_instituicaos").should route_to("admin_instituicaos#index")
    end

    it "routes to #new" do
      get("/admin_instituicaos/new").should route_to("admin_instituicaos#new")
    end

    it "routes to #show" do
      get("/admin_instituicaos/1").should route_to("admin_instituicaos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_instituicaos/1/edit").should route_to("admin_instituicaos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_instituicaos").should route_to("admin_instituicaos#create")
    end

    it "routes to #update" do
      put("/admin_instituicaos/1").should route_to("admin_instituicaos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_instituicaos/1").should route_to("admin_instituicaos#destroy", :id => "1")
    end

  end
end
