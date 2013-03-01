require 'spec_helper'

describe "admin_instituicaos/new" do
  before(:each) do
    assign(:admin_instituicao, stub_model(AdminInstituicao,
      :nome => "MyString",
      :email => "MyString",
      :telefone => "MyString",
      :rg => "MyString",
      :cpf => "MyString"
    ).as_new_record)
  end

  it "renders new admin_instituicao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_instituicaos_path, :method => "post" do
      assert_select "input#admin_instituicao_nome", :name => "admin_instituicao[nome]"
      assert_select "input#admin_instituicao_email", :name => "admin_instituicao[email]"
      assert_select "input#admin_instituicao_telefone", :name => "admin_instituicao[telefone]"
      assert_select "input#admin_instituicao_rg", :name => "admin_instituicao[rg]"
      assert_select "input#admin_instituicao_cpf", :name => "admin_instituicao[cpf]"
    end
  end
end
