require 'spec_helper'

describe "admin_instituicaos/show" do
  before(:each) do
    @admin_instituicao = assign(:admin_instituicao, stub_model(AdminInstituicao,
      :nome => "Nome",
      :email => "Email",
      :telefone => "Telefone",
      :rg => "Rg",
      :cpf => "Cpf"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Email/)
    rendered.should match(/Telefone/)
    rendered.should match(/Rg/)
    rendered.should match(/Cpf/)
  end
end
