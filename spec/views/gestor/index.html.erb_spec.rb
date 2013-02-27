require 'spec_helper'

describe "gestor/index" do
  before(:each) do
    assign(:gestor, [
      stub_model(Gestor),
      stub_model(Gestor)
    ])
  end

  it "renders a list of gestor" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
