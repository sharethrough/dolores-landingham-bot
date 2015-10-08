require "rails_helper"

feature "Create scheduled message" do
  scenario "successfully without tags" do
    login_with_oauth
    visit root_path
    click_on "Create scheduled message"

    fill_in "Title", with: "Message title"
    fill_in "Message body", with: "Message body"
    fill_in "Days after employee starts to send message", with: 1
    click_on "Create Scheduled message"

    expect(page).to have_content("Scheduled message created successfully")
  end

  scenario "successfully with tags" do
    login_with_oauth
    visit root_path
    click_on "Create scheduled message"

    fill_in "Title", with: "Message title"
    fill_in "Message body", with: "Message body"
    fill_in "Days after employee starts to send message", with: 1
    fill_in "Tags (seperated by commas)", with: "tag_one tag_two tag_three"
    click_on "Create Scheduled message"

    expect(page).to have_content("Scheduled message created successfully")
  end
end
