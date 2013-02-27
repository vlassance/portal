require 'spec_helper'

describe "gestor/edit" do
  before(:each) do
    @gestor = assign(:gestor, stub_model(Gestor))
  end

  it "renders the edit gestor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gestor_index_path(@gestor), :method => "post" do
    end
  end
end
