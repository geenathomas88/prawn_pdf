require 'spec_helper'

describe "activity_statuses/edit" do
  before(:each) do
    @activity_status = assign(:activity_status, stub_model(ActivityStatus,
      :name => "MyString"
    ))
  end

  it "renders the edit activity_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => activity_statuses_path(@activity_status), :method => "post" do
      assert_select "input#activity_status_name", :name => "activity_status[name]"
    end
  end
end
