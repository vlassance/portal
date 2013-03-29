require 'spec_helper'

describe "coordenador_estagios/new" do
  before(:each) do
    assign(:coordenador_estagio, stub_model(CoordenadorEstagio).as_new_record)
  end

  it "renders new coordenador_estagio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coordenador_estagios_path, :method => "post" do
    end
  end
end
