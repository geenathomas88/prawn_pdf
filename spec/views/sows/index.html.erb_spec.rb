require 'spec_helper'

describe "sows/index" do
  before(:each) do
    assign(:sows, [
      stub_model(Sow,
        :name => "Name"
      ),
      stub_model(Sow,
        :name => "Name"
      )
    ])
  end

  it "renders a list of sows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
