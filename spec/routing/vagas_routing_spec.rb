require "spec_helper"

describe VagasController do
  describe "routing" do

    it "routes to #index" do
      get("/vagas").should route_to("vagas#index")
    end

    it "routes to #new" do
      get("/vagas/new").should route_to("vagas#new")
    end

    it "routes to #show" do
      get("/vagas/1").should route_to("vagas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vagas/1/edit").should route_to("vagas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vagas").should route_to("vagas#create")
    end

    it "routes to #update" do
      put("/vagas/1").should route_to("vagas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vagas/1").should route_to("vagas#destroy", :id => "1")
    end

  end
end
