require 'spec_helper'

describe "gestor/show" do
  before(:each) do
    @gestor = assign(:gestor, stub_model(Gestor))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
