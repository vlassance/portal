require 'spec_helper'

describe "Vagas" do
  describe "GET /vagas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vagas_path
      response.status.should be(200)
    end
  end
end
