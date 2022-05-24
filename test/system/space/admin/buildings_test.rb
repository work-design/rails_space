require "application_system_test_case"

class BuildingsTest < ApplicationSystemTestCase
  setup do
    @space_admin_building = space_admin_buildings(:one)
  end

  test "visiting the index" do
    visit space_admin_buildings_url
    assert_selector "h1", text: "Buildings"
  end

  test "should create building" do
    visit space_admin_buildings_url
    click_on "New building"

    fill_in "Code", with: @space_admin_building.code
    fill_in "Name", with: @space_admin_building.name
    click_on "Create Building"

    assert_text "Building was successfully created"
    click_on "Back"
  end

  test "should update Building" do
    visit space_admin_building_url(@space_admin_building)
    click_on "Edit this building", match: :first

    fill_in "Code", with: @space_admin_building.code
    fill_in "Name", with: @space_admin_building.name
    click_on "Update Building"

    assert_text "Building was successfully updated"
    click_on "Back"
  end

  test "should destroy Building" do
    visit space_admin_building_url(@space_admin_building)
    click_on "Destroy this building", match: :first

    assert_text "Building was successfully destroyed"
  end
end
