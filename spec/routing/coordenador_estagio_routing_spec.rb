require "spec_helper"

describe CoordenadorEstagioController do
  describe "routing" do

    it "routes to #index" do
      get("/coordenador_estagio").should route_to("coordenador_estagio#index")
    end

    it "routes to #new" do
      get("/coordenador_estagio/new").should route_to("coordenador_estagio#new")
    end

    it "routes to #show" do
      get("/coordenador_estagio/1").should route_to("coordenador_estagio#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coordenador_estagio/1/edit").should route_to("coordenador_estagio#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coordenador_estagio").should route_to("coordenador_estagio#create")
    end

    it "routes to #update" do
      put("/coordenador_estagio/1").should route_to("coordenador_estagio#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coordenador_estagio/1").should route_to("coordenador_estagio#destroy", :id => "1")
    end

  end
end
