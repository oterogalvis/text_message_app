require 'spec_helper'

describe "Sending text message" do 
	it "redirects to the text messages index page on success" do
		visit "/text_messages"
		click_link "New Text message"
		expect(page).to have_content("New Text Message")

		fill_in "Number", with: "7868770469"
		fill_in "Body", with: "Prueba por medio de create_spec.rb"
		click_button "Create Text message"

		expect(page).to have_content("7868770469")
	end

	it "display an error when the the new text have no number" do
		expect(TextMessage.count).to eq(0)

		visit "/text_messages"
		click_link "New Text message"
		expect(page).to have_content("New Text Message")

		fill_in "Number", with: ""
		fill_in "Body", with: "Prueba por medio de create_spec.rb"
		click_button "Create Text message"

		expect(page).to have_content("error")		
		expect(TextMessage.count).to eq(0)

		visit "/text_messages"
		expect(page).to_not have_content("7868770469")		
	end

	it "display an error when number is less or more thatn 10 digits" do
		expect(TextMessage.count).to eq(0)

		visit "/text_messages"
		click_link "New Text message"
		expect(page).to have_content("New Text Message")

		fill_in "Number", with: "786877"
		fill_in "Body", with: "Prueba por medio de create_spec.rb"
		click_button "Create Text message"

		expect(page).to have_content("error")		
		expect(TextMessage.count).to eq(0)

		visit "/text_messages"
		expect(page).to_not have_content("7868770469")		
	end

	it "display an error when number is not only numeric digits" do
		expect(TextMessage.count).to eq(0)

		visit "/text_messages"
		click_link "New Text message"
		expect(page).to have_content("New Text Message")

		fill_in "Number", with: "786abcd877"
		fill_in "Body", with: "Prueba por medio de create_spec.rb"
		click_button "Create Text message"

		expect(page).to have_content("error")		
		expect(TextMessage.count).to eq(0)

		visit "/text_messages"
		expect(page).to_not have_content("7868770469")		
	end
end