require "rails_helper"

feature "User can create a new room" do
  context "When the user is not logged in" do
    scenario "from the home page" do
      visit root_path

      fill_in "Display name", with: "Room User"
      click_on "Create Room"

      room = Room.last
      expect(current_path).to eq room_path(room.number)
      expect(page).to have_content "Room number: #{room.number}"
      expect(room.user.name).to eq "Room User"
      expect(room.user.username).to include("guest-")
      expect(room.user.email).to include("guest-")
      expect(room.user.guest).to eq(true)
      expect(room.private).to eq(false)
    end
  end
  context "When the user is logged in" do
    scenario "from the home page" do
      user = create(:user)
      sign_in user

      visit root_path
      click_on "Create Room"

      room = Room.last
      expect(current_path).to eq room_path(room.number)
      expect(page).to have_content "Room number: #{room.number}"
      expect(room.user).to eq(user)
      expect(room.user.name).to eq user.name
      expect(room.user.username).to include(user.username)
      expect(room.user.email).to include(user.email)
      expect(room.user.guest).to eq(false)
      expect(room.private).to eq(false)
    end
  end
end
