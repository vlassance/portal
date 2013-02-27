require 'spec_helper'

describe "empresas/show" do
  before(:each) do
    @empresa = assign(:empresa, stub_model(Empresa,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Endereco/)
    rendered.should match(/Cidade/)
    rendered.should match(/Cep/)
    rendered.should match(/Telefone/)
    rendered.should match(/Email/)
    rendered.should match(/Cidade/)
    rendered.should match(/Pais/)
    rendered.should match(/Estado/)
    rendered.should match(/Descricao/)
    rendered.should match(/Site/)
  end
end
