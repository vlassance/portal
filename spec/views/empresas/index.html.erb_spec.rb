require 'spec_helper'

describe "empresas/index" do
  before(:each) do
    assign(:empresas, [
      stub_model(Empresa,
        :nome => "Nome",
        :endereco => "Endereco",
        :cidade => "Cidade",
        :cep => "Cep",
        :telefone => "Telefone",
        :email => "Email",
        :cidade => "Cidade",
        :pais => "Pais",
        :estado => "Estado",
        :descricao => "Descricao",
        :site => "Site"
      ),
      stub_model(Empresa,
        :nome => "Nome",
        :endereco => "Endereco",
        :cidade => "Cidade",
        :cep => "Cep",
        :telefone => "Telefone",
        :email => "Email",
        :cidade => "Cidade",
        :pais => "Pais",
        :estado => "Estado",
        :descricao => "Descricao",
        :site => "Site"
      )
    ])
  end

  it "renders a list of empresas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Pais".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Site".to_s, :count => 2
  end
end
