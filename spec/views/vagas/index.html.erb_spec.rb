require 'spec_helper'

describe "vagas/index" do
  before(:each) do
    assign(:vagas, [
      stub_model(Vaga,
        :nome => "Nome",
        :descricao => "Descricao",
        :salario => "Salario",
        :requisitos => "Requisitos",
        :linguas => "Linguas",
        :conhecimentos => "Conhecimentos",
        :area => "Area"
      ),
      stub_model(Vaga,
        :nome => "Nome",
        :descricao => "Descricao",
        :salario => "Salario",
        :requisitos => "Requisitos",
        :linguas => "Linguas",
        :conhecimentos => "Conhecimentos",
        :area => "Area"
      )
    ])
  end

  it "renders a list of vagas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Salario".to_s, :count => 2
    assert_select "tr>td", :text => "Requisitos".to_s, :count => 2
    assert_select "tr>td", :text => "Linguas".to_s, :count => 2
    assert_select "tr>td", :text => "Conhecimentos".to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
  end
end
