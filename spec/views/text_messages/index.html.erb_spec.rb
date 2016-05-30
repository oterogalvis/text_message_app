require 'spec_helper'

describe "text_messages/index" do
  before(:each) do
    assign(:text_messages, [
      stub_model(TextMessage,
        :number => "Number",
        :body => "Body"
      ),
      stub_model(TextMessage,
        :number => "Number",
        :body => "Body"
      )
    ])
  end

  it "renders a list of text_messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
