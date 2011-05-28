require 'spec_helper'

describe "contacts/edit.html.haml" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :name => "MyString",
      :number => "MyString",
      :jid => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path(@contact), :method => "post" do
      assert_select "input#contact_name", :name => "contact[name]"
      assert_select "input#contact_number", :name => "contact[number]"
      assert_select "input#contact_jid", :name => "contact[jid]"
    end
  end
end
