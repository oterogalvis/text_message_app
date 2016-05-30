require 'spec_helper'

describe "text_messages/show" do
  before(:each) do
    @text_message = assign(:text_message, stub_model(TextMessage,
      :number => "Number",
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/Body/)
  end
end
