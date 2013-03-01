require 'spec_helper'

describe "vagas/edit" do
  before(:each) do
    @vaga = assign(:vaga, stub_model(Vaga,
      :nome => "MyString",
      :descricao => "MyString",
      :salario => "MyString",
      :requisitos => "MyString",
      :linguas => "MyString",
      :conhecimentos => "MyString",
      :area => "MyString"
    ))
  end

  it "renders the edit vaga form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vagas_path(@vaga), :method => "post" do
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
