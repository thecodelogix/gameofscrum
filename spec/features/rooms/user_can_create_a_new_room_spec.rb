require "rails_helper"

feature "User can create a new room", js: true do
  context "When the user is not logged in" do
    scenario "from the home page" do
      visit root_path

      fill_in "Display name", with: "Room User"
      click_on "Create Room"

      room = Room.last
      expect(current_path).to eq room_path(room.number)
      expect(page).to have_content "Room User"
      expect(page).to have_content "Room Number: #{room.number}"
    end
  end
end
