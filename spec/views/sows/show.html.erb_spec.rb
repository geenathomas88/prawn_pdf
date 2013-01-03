require 'spec_helper'

describe "sows/show" do
  before(:each) do
    @sow = assign(:sow, stub_model(Sow,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
