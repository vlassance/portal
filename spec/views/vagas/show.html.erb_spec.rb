require 'spec_helper'

describe "vagas/show" do
  before(:each) do
    @vaga = assign(:vaga, stub_model(Vaga,
      :nome => "Nome",
      :descricao => "Descricao",
      :salario => "Salario",
      :requisitos => "Requisitos",
      :linguas => "Linguas",
      :conhecimentos => "Conhecimentos",
      :area => "Area"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Descricao/)
    rendered.should match(/Salario/)
    rendered.should match(/Requisitos/)
    rendered.should match(/Linguas/)
    rendered.should match(/Conhecimentos/)
    rendered.should match(/Area/)
  end
end
