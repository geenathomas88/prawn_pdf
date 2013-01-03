require 'spec_helper'

describe "clients/edit" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :client_name => "MyString",
      :client_contact => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path(@client), :method => "post" do
      assert_select "input#client_client_name", :name => "client[client_name]"
      assert_select "input#client_client_contact", :name => "client[client_contact]"
    end
  end
end
