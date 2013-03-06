require 'spec_helper'

describe "coordenador_estagio/show" do
  before(:each) do
    @coordenador_estagio = assign(:coordenador_estagio, stub_model(CoordenadorEstagio))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
