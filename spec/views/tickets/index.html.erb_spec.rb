require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :job_ticket_no => "Job Ticket No",
        :client_no => "Client No",
        :client_job_name => "Client Job Name",
        :brand => "Brand",
        :product => "Product",
        :activity => "Activity",
        :change_type => "Change Type",
        :activity_status => "Activity Status",
        :version => "Version",
        :priority => "Priority",
        :quote_values => "Quote Values",
        :ncn_raised_by => "Ncn Raised By",
        :onsite_coordinator => "Onsite Coordinator",
        :production => "Production",
        :QA => "Qa",
        :onsite_review_close => "Onsite Review Close",
        :agency_review_close => "Agency Review Close",
        :deliver => "Deliver"
      ),
      stub_model(Ticket,
        :job_ticket_no => "Job Ticket No",
        :client_no => "Client No",
        :client_job_name => "Client Job Name",
        :brand => "Brand",
        :product => "Product",
        :activity => "Activity",
        :change_type => "Change Type",
        :activity_status => "Activity Status",
        :version => "Version",
        :priority => "Priority",
        :quote_values => "Quote Values",
        :ncn_raised_by => "Ncn Raised By",
        :onsite_coordinator => "Onsite Coordinator",
        :production => "Production",
        :QA => "Qa",
        :onsite_review_close => "Onsite Review Close",
        :agency_review_close => "Agency Review Close",
        :deliver => "Deliver"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Job Ticket No".to_s, :count => 2
    assert_select "tr>td", :text => "Client No".to_s, :count => 2
    assert_select "tr>td", :text => "Client Job Name".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
    assert_select "tr>td", :text => "Change Type".to_s, :count => 2
    assert_select "tr>td", :text => "Activity Status".to_s, :count => 2
    assert_select "tr>td", :text => "Version".to_s, :count => 2
    assert_select "tr>td", :text => "Priority".to_s, :count => 2
    assert_select "tr>td", :text => "Quote Values".to_s, :count => 2
    assert_select "tr>td", :text => "Ncn Raised By".to_s, :count => 2
    assert_select "tr>td", :text => "Onsite Coordinator".to_s, :count => 2
    assert_select "tr>td", :text => "Production".to_s, :count => 2
    assert_select "tr>td", :text => "Qa".to_s, :count => 2
    assert_select "tr>td", :text => "Onsite Review Close".to_s, :count => 2
    assert_select "tr>td", :text => "Agency Review Close".to_s, :count => 2
    assert_select "tr>td", :text => "Deliver".to_s, :count => 2
  end
end
