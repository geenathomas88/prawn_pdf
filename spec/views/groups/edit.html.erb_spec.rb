require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :group_name => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => groups_path(@group), :method => "post" do
      assert_select "input#group_group_name", :name => "group[group_name]"
      assert_select "input#group_user_id", :name => "group[user_id]"
    end
  end
end
