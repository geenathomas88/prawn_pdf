require 'spec_helper'

describe "change_types/edit" do
  before(:each) do
    @change_type = assign(:change_type, stub_model(ChangeType,
      :name => "MyString"
    ))
  end

  it "renders the edit change_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => change_types_path(@change_type), :method => "post" do
      assert_select "input#change_type_name", :name => "change_type[name]"
    end
  end
end
