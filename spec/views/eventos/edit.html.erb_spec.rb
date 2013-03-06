require 'spec_helper'

describe "eventos/edit" do
  before(:each) do
    @evento = assign(:evento, stub_model(Evento,
      :nome => "MyString",
      :descricao => "MyText"
    ))
  end

  it "renders the edit evento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => eventos_path(@evento), :method => "post" do
      assert_select "input#evento_nome", :name => "evento[nome]"
      assert_select "textarea#evento_descricao", :name => "evento[descricao]"
    end
  end
end
