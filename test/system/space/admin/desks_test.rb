require "application_system_test_case"

class DesksTest < ApplicationSystemTestCase
  setup do
    @space_admin_desk = space_admin_desks(:one)
  end

  test "visiting the index" do
    visit space_admin_desks_url
    assert_selector "h1", text: "Desks"
  end

  test "should create desk" do
    visit space_admin_desks_url
    click_on "New desk"

    fill_in "Code", with: @space_admin_desk.code
    fill_in "Height", with: @space_admin_desk.height
    fill_in "Length", with: @space_admin_desk.length
    fill_in "Name", with: @space_admin_desk.name
    fill_in "Width", with: @space_admin_desk.width
    click_on "Create Desk"

    assert_text "Desk was successfully created"
    click_on "Back"
  end

  test "should update Desk" do
    visit space_admin_desk_url(@space_admin_desk)
    click_on "Edit this desk", match: :first

    fill_in "Code", with: @space_admin_desk.code
    fill_in "Height", with: @space_admin_desk.height
    fill_in "Length", with: @space_admin_desk.length
    fill_in "Name", with: @space_admin_desk.name
    fill_in "Width", with: @space_admin_desk.width
    click_on "Update Desk"

    assert_text "Desk was successfully updated"
    click_on "Back"
  end

  test "should destroy Desk" do
    visit space_admin_desk_url(@space_admin_desk)
    click_on "Destroy this desk", match: :first

    assert_text "Desk was successfully destroyed"
  end
end
