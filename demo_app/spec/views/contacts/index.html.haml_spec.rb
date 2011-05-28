require 'spec_helper'

describe "contacts/index.html.haml" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :name => "Name",
        :number => "Number",
        :jid => "Jid"
      ),
      stub_model(Contact,
        :name => "Name",
        :number => "Number",
        :jid => "Jid"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Jid".to_s, :count => 2
  end
end
