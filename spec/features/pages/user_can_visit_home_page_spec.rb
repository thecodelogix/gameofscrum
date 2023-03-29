require "rails_helper"

feature "User can visit home page" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_content("scrum poker")
  end
end
