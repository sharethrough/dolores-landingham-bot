require "rails_helper"

feature "Edit scheduled messages" do
  scenario "from list of scheduled messages without tags" do
    old_title = "Old title"
    new_title = "New title"
    create(:scheduled_message, title: old_title)

    login_with_oauth
    visit scheduled_messages_path
    click_on "Edit"
    fill_in "Title", with: new_title
    click_on "Update Scheduled message"

    expect(page).to have_content "Scheduled message updated successfully"
    expect(page).to have_content new_title
  end

  scenario "from list of scheduled messages with tags" do
    old_title = "Old title"
    new_title = "New title"
    tags = "tag_one, tag_two, tag_three"
    create(:scheduled_message, title: old_title)

    login_with_oauth
    visit scheduled_messages_path
    click_on "Edit"
    fill_in "Title", with: new_title
    fill_in "Tags (separated by commas)", with: tags
    click_on "Update Scheduled message"

    expect(page).to have_content "Scheduled message updated successfully"
    expect(page).to have_content new_title
    expect(page).to have_content "tag_one"
    expect(page).to have_content "tag_two"
    expect(page).to have_content "tag_three"
  end
end
