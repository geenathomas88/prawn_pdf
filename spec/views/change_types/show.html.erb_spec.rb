require 'spec_helper'

describe "change_types/show" do
  before(:each) do
    @change_type = assign(:change_type, stub_model(ChangeType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
