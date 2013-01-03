require 'spec_helper'

describe "sows/new" do
  before(:each) do
    assign(:sow, stub_model(Sow,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new sow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sows_path, :method => "post" do
      assert_select "input#sow_name", :name => "sow[name]"
    end
  end
end
