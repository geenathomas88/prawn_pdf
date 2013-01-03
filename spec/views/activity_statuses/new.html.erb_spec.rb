require 'spec_helper'

describe "activity_statuses/new" do
  before(:each) do
    assign(:activity_status, stub_model(ActivityStatus,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new activity_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => activity_statuses_path, :method => "post" do
      assert_select "input#activity_status_name", :name => "activity_status[name]"
    end
  end
end
