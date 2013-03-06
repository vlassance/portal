require 'spec_helper'

describe "coordenador_estagio/index" do
  before(:each) do
    assign(:coordenador_estagio, [
      stub_model(CoordenadorEstagio),
      stub_model(CoordenadorEstagio)
    ])
  end

  it "renders a list of coordenador_estagio" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
