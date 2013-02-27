require 'spec_helper'

describe "admin_empresa/new" do
  before(:each) do
    assign(:admin_empresa, stub_model(AdminEmpresa,
      :nome => "MyString",
      :email => "MyString",
      :telefone => "MyString",
      :celular => "MyString",
      :cpf => "MyString",
      :cidade => "MyString",
      :estado => "MyString",
      :pais => "MyString",
      :cep => "MyString"
    ).as_new_record)
  end

  it "renders new admin_empresa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_empresa_index_path, :method => "post" do
      assert_select "input#admin_empresa_nome", :name => "admin_empresa[nome]"
      assert_select "input#admin_empresa_email", :name => "admin_empresa[email]"
      assert_select "input#admin_empresa_telefone", :name => "admin_empresa[telefone]"
      assert_select "input#admin_empresa_celular", :name => "admin_empresa[celular]"
      assert_select "input#admin_empresa_cpf", :name => "admin_empresa[cpf]"
      assert_select "input#admin_empresa_cidade", :name => "admin_empresa[cidade]"
      assert_select "input#admin_empresa_estado", :name => "admin_empresa[estado]"
      assert_select "input#admin_empresa_pais", :name => "admin_empresa[pais]"
      assert_select "input#admin_empresa_cep", :name => "admin_empresa[cep]"
    end
  end
end
