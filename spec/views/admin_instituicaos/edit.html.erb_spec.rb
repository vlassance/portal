require 'spec_helper'

describe "admin_instituicaos/edit" do
  before(:each) do
    @admin_instituicao = assign(:admin_instituicao, stub_model(AdminInstituicao,
      :nome => "MyString",
      :email => "MyString",
      :telefone => "MyString",
      :rg => "MyString",
      :cpf => "MyString"
    ))
  end

  it "renders the edit admin_instituicao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_instituicaos_path(@admin_instituicao), :method => "post" do
      assert_select "input#admin_instituicao_nome", :name => "admin_instituicao[nome]"
      assert_select "input#admin_instituicao_email", :name => "admin_instituicao[email]"
      assert_select "input#admin_instituicao_telefone", :name => "admin_instituicao[telefone]"
      assert_select "input#admin_instituicao_rg", :name => "admin_instituicao[rg]"
      assert_select "input#admin_instituicao_cpf", :name => "admin_instituicao[cpf]"
    end
  end
end
