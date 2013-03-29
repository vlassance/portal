require 'spec_helper'

describe "eventos/new" do
  before(:each) do
    assign(:evento, stub_model(Evento,
      :nome => "MyString",
      :descricao => "MyText"
    ).as_new_record)
  end

  it "renders new evento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => eventos_path, :method => "post" do
      assert_select "input#evento_nome", :name => "evento[nome]"
      assert_select "textarea#evento_descricao", :name => "evento[descricao]"
    end
  end
end
