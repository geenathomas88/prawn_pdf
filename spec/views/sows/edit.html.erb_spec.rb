require 'spec_helper'

describe "sows/edit" do
  before(:each) do
    @sow = assign(:sow, stub_model(Sow,
      :name => "MyString"
    ))
  end

  it "renders the edit sow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sows_path(@sow), :method => "post" do
      assert_select "input#sow_name", :name => "sow[name]"
    end
  end
end
