require "spec_helper"

describe CoordenadorEstagiosController do
  describe "routing" do

    it "routes to #index" do
      get("/coordenador_estagios").should route_to("coordenador_estagios#index")
    end

    it "routes to #new" do
      get("/coordenador_estagios/new").should route_to("coordenador_estagios#new")
    end

    it "routes to #show" do
      get("/coordenador_estagios/1").should route_to("coordenador_estagios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coordenador_estagios/1/edit").should route_to("coordenador_estagios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coordenador_estagios").should route_to("coordenador_estagios#create")
    end

    it "routes to #update" do
      put("/coordenador_estagios/1").should route_to("coordenador_estagios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coordenador_estagios/1").should route_to("coordenador_estagios#destroy", :id => "1")
    end

  end
end
