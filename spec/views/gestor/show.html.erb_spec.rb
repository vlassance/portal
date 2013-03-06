require 'spec_helper'

describe "gestor/show" do
  before(:each) do
    @gestor = assign(:gestor, stub_model(Gestor,
      :nome => "Nome",
      :email => "Email",
      :telefone => "Telefone",
      :celular => "Celular",
      :cpf => "Cpf",
      :cidade => "Cidade",
      :estado => "Estado",
      :pais => "Pais",
      :cep => "Cep"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Email/)
    rendered.should match(/Telefone/)
    rendered.should match(/Celular/)
    rendered.should match(/Cpf/)
    rendered.should match(/Cidade/)
    rendered.should match(/Estado/)
    rendered.should match(/Pais/)
    rendered.should match(/Cep/)
  end
end
