require 'spec_helper'

describe "coordenador_estagios/index" do
  before(:each) do
    assign(:coordenador_estagios, [
      stub_model(CoordenadorEstagio),
      stub_model(CoordenadorEstagio)
    ])
  end

  it "renders a list of coordenador_estagios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
