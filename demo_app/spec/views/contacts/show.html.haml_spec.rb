require 'spec_helper'

describe "contacts/show.html.haml" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :name => "Name",
      :number => "Number",
      :jid => "Jid"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Jid/)
  end
end
