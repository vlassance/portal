require 'spec_helper'

describe "admin_instituicaos/index" do
  before(:each) do
    assign(:admin_instituicaos, [
      stub_model(AdminInstituicao,
        :nome => "Nome",
        :email => "Email",
        :telefone => "Telefone",
        :rg => "Rg",
        :cpf => "Cpf"
      ),
      stub_model(AdminInstituicao,
        :nome => "Nome",
        :email => "Email",
        :telefone => "Telefone",
        :rg => "Rg",
        :cpf => "Cpf"
      )
    ])
  end

  it "renders a list of admin_instituicaos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
  end
end
