require 'spec_helper'

describe "coordenador_estagio/edit" do
  before(:each) do
    @coordenador_estagio = assign(:coordenador_estagio, stub_model(CoordenadorEstagio))
  end

  it "renders the edit coordenador_estagio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coordenador_estagio_index_path(@coordenador_estagio), :method => "post" do
    end
  end
end
