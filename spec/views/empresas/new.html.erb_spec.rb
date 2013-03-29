require 'spec_helper'

describe "empresas/new" do
  before(:each) do
    assign(:empresa, stub_model(Empresa,
      :nome => "MyString",
      :endereco => "MyString",
      :cidade => "MyString",
      :cep => "MyString",
      :telefone => "MyString",
      :email => "MyString",
      :cidade => "MyString",
      :pais => "MyString",
      :estado => "MyString",
      :descricao => "MyString",
      :site => "MyString"
    ).as_new_record)
  end

  it "renders new empresa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => empresas_path, :method => "post" do
      assert_select "input#empresa_nome", :name => "empresa[nome]"
      assert_select "input#empresa_endereco", :name => "empresa[endereco]"
      assert_select "input#empresa_cidade", :name => "empresa[cidade]"
      assert_select "input#empresa_cep", :name => "empresa[cep]"
      assert_select "input#empresa_telefone", :name => "empresa[telefone]"
      assert_select "input#empresa_email", :name => "empresa[email]"
      assert_select "input#empresa_cidade", :name => "empresa[cidade]"
      assert_select "input#empresa_pais", :name => "empresa[pais]"
      assert_select "input#empresa_estado", :name => "empresa[estado]"
      assert_select "input#empresa_descricao", :name => "empresa[descricao]"
      assert_select "input#empresa_site", :name => "empresa[site]"
    end
  end
end
