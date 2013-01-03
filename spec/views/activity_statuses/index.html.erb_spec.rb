require 'spec_helper'

describe "activity_statuses/index" do
  before(:each) do
    assign(:activity_statuses, [
      stub_model(ActivityStatus,
        :name => "Name"
      ),
      stub_model(ActivityStatus,
        :name => "Name"
      )
    ])
  end

  it "renders a list of activity_statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
