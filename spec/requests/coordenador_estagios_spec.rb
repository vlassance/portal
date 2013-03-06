require 'spec_helper'

describe "CoordenadorEstagios" do
  describe "GET /coordenador_estagios" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get coordenador_estagios_path
      response.status.should be(200)
    end
  end
end
