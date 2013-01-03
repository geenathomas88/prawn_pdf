require 'spec_helper'

describe "change_types/index" do
  before(:each) do
    assign(:change_types, [
      stub_model(ChangeType,
        :name => "Name"
      ),
      stub_model(ChangeType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of change_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
