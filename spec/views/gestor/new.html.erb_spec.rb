require 'spec_helper'

describe "gestor/new" do
  before(:each) do
    assign(:gestor, stub_model(Gestor,
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

  it "renders new gestor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gestor_index_path, :method => "post" do
      assert_select "input#gestor_nome", :name => "gestor[nome]"
      assert_select "input#gestor_email", :name => "gestor[email]"
      assert_select "input#gestor_telefone", :name => "gestor[telefone]"
      assert_select "input#gestor_celular", :name => "gestor[celular]"
      assert_select "input#gestor_cpf", :name => "gestor[cpf]"
      assert_select "input#gestor_cidade", :name => "gestor[cidade]"
      assert_select "input#gestor_estado", :name => "gestor[estado]"
      assert_select "input#gestor_pais", :name => "gestor[pais]"
      assert_select "input#gestor_cep", :name => "gestor[cep]"
    end
  end
end
