require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @space_admin_room = space_admin_rooms(:one)
  end

  test "visiting the index" do
    visit space_admin_rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "should create room" do
    visit space_admin_rooms_url
    click_on "New room"

    fill_in "Code", with: @space_admin_room.code
    fill_in "Floor", with: @space_admin_room.floor
    fill_in "Name", with: @space_admin_room.name
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back"
  end

  test "should update Room" do
    visit space_admin_room_url(@space_admin_room)
    click_on "Edit this room", match: :first

    fill_in "Code", with: @space_admin_room.code
    fill_in "Floor", with: @space_admin_room.floor
    fill_in "Name", with: @space_admin_room.name
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "should destroy Room" do
    visit space_admin_room_url(@space_admin_room)
    click_on "Destroy this room", match: :first

    assert_text "Room was successfully destroyed"
  end
end
