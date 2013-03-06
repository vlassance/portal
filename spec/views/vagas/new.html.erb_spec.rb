require 'spec_helper'

describe "vagas/new" do
  before(:each) do
    assign(:vaga, stub_model(Vaga,
      :nome => "MyString",
      :descricao => "MyString",
      :salario => "MyString",
      :requisitos => "MyString",
      :linguas => "MyString",
      :conhecimentos => "MyString",
      :area => "MyString"
    ).as_new_record)
  end

  it "renders new vaga form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vagas_path, :method => "post" do
      assert_select "input#vaga_nome", :name => "vaga[nome]"
      assert_select "input#vaga_descricao", :name => "vaga[descricao]"
      assert_select "input#vaga_salario", :name => "vaga[salario]"
      assert_select "input#vaga_requisitos", :name => "vaga[requisitos]"
      assert_select "input#vaga_linguas", :name => "vaga[linguas]"
      assert_select "input#vaga_conhecimentos", :name => "vaga[conhecimentos]"
      assert_select "input#vaga_area", :name => "vaga[area]"
    end
  end
end
