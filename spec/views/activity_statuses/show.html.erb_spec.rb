require 'spec_helper'

describe "activity_statuses/show" do
  before(:each) do
    @activity_status = assign(:activity_status, stub_model(ActivityStatus,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
