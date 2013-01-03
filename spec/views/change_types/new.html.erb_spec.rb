require 'spec_helper'

describe "change_types/new" do
  before(:each) do
    assign(:change_type, stub_model(ChangeType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new change_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => change_types_path, :method => "post" do
      assert_select "input#change_type_name", :name => "change_type[name]"
    end
  end
end
