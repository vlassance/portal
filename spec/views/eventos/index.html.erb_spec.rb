require 'spec_helper'

describe "eventos/index" do
  before(:each) do
    assign(:eventos, [
      stub_model(Evento,
        :nome => "Nome",
        :descricao => "MyText"
      ),
      stub_model(Evento,
        :nome => "Nome",
        :descricao => "MyText"
      )
    ])
  end

  it "renders a list of eventos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
