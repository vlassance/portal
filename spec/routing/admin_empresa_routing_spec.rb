require "spec_helper"

describe AdminEmpresaController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_empresa").should route_to("admin_empresa#index")
    end

    it "routes to #new" do
      get("/admin_empresa/new").should route_to("admin_empresa#new")
    end

    it "routes to #show" do
      get("/admin_empresa/1").should route_to("admin_empresa#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_empresa/1/edit").should route_to("admin_empresa#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_empresa").should route_to("admin_empresa#create")
    end

    it "routes to #update" do
      put("/admin_empresa/1").should route_to("admin_empresa#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_empresa/1").should route_to("admin_empresa#destroy", :id => "1")
    end

  end
end
