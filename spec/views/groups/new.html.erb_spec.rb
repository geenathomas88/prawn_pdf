require 'spec_helper'

describe "groups/new" do
  before(:each) do
    assign(:group, stub_model(Group,
      :group_name => "MyString",
      :user_id => "MyString"
    ).as_new_record)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => groups_path, :method => "post" do
      assert_select "input#group_group_name", :name => "group[group_name]"
      assert_select "input#group_user_id", :name => "group[user_id]"
    end
  end
end
