require 'spec_helper'

describe "gestor/index" do
  before(:each) do
    assign(:gestor, [
      stub_model(Gestor,
        :nome => "Nome",
        :email => "Email",
        :telefone => "Telefone",
        :celular => "Celular",
        :cpf => "Cpf",
        :cidade => "Cidade",
        :estado => "Estado",
        :pais => "Pais",
        :cep => "Cep"
      ),
      stub_model(Gestor,
        :nome => "Nome",
        :email => "Email",
        :telefone => "Telefone",
        :celular => "Celular",
        :cpf => "Cpf",
        :cidade => "Cidade",
        :estado => "Estado",
        :pais => "Pais",
        :cep => "Cep"
      )
    ])
  end

  it "renders a list of gestor" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Celular".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Pais".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
  end
end
