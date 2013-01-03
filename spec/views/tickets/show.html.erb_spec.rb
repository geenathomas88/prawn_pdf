require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Job Ticket No/)
    rendered.should match(/Client No/)
    rendered.should match(/Client Job Name/)
    rendered.should match(/Brand/)
    rendered.should match(/Product/)
    rendered.should match(/Activity/)
    rendered.should match(/Change Type/)
    rendered.should match(/Activity Status/)
    rendered.should match(/Version/)
    rendered.should match(/Priority/)
    rendered.should match(/Quote Values/)
    rendered.should match(/Ncn Raised By/)
    rendered.should match(/Onsite Coordinator/)
    rendered.should match(/Production/)
    rendered.should match(/Qa/)
    rendered.should match(/Onsite Review Close/)
    rendered.should match(/Agency Review Close/)
    rendered.should match(/Deliver/)
  end
end
