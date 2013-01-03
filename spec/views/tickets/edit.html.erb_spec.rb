require 'spec_helper'

describe "tickets/edit" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :job_ticket_no => "MyString",
      :client_no => "MyString",
      :client_job_name => "MyString",
      :brand => "MyString",
      :product => "MyString",
      :activity => "MyString",
      :change_type => "MyString",
      :activity_status => "MyString",
      :version => "MyString",
      :priority => "MyString",
      :quote_values => "MyString",
      :ncn_raised_by => "MyString",
      :onsite_coordinator => "MyString",
      :production => "MyString",
      :QA => "MyString",
      :onsite_review_close => "MyString",
      :agency_review_close => "MyString",
      :deliver => "MyString"
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path(@ticket), :method => "post" do
      assert_select "input#ticket_job_ticket_no", :name => "ticket[job_ticket_no]"
      assert_select "input#ticket_client_no", :name => "ticket[client_no]"
      assert_select "input#ticket_client_job_name", :name => "ticket[client_job_name]"
      assert_select "input#ticket_brand", :name => "ticket[brand]"
      assert_select "input#ticket_product", :name => "ticket[product]"
      assert_select "input#ticket_activity", :name => "ticket[activity]"
      assert_select "input#ticket_change_type", :name => "ticket[change_type]"
      assert_select "input#ticket_activity_status", :name => "ticket[activity_status]"
      assert_select "input#ticket_version", :name => "ticket[version]"
      assert_select "input#ticket_priority", :name => "ticket[priority]"
      assert_select "input#ticket_quote_values", :name => "ticket[quote_values]"
      assert_select "input#ticket_ncn_raised_by", :name => "ticket[ncn_raised_by]"
      assert_select "input#ticket_onsite_coordinator", :name => "ticket[onsite_coordinator]"
      assert_select "input#ticket_production", :name => "ticket[production]"
      assert_select "input#ticket_QA", :name => "ticket[QA]"
      assert_select "input#ticket_onsite_review_close", :name => "ticket[onsite_review_close]"
      assert_select "input#ticket_agency_review_close", :name => "ticket[agency_review_close]"
      assert_select "input#ticket_deliver", :name => "ticket[deliver]"
    end
  end
end
