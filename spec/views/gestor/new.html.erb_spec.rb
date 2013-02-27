require 'spec_helper'

describe "gestor/new" do
  before(:each) do
    assign(:gestor, stub_model(Gestor).as_new_record)
  end

  it "renders new gestor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gestor_index_path, :method => "post" do
    end
  end
end
