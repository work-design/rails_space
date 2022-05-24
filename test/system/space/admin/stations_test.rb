require "application_system_test_case"

class StationsTest < ApplicationSystemTestCase
  setup do
    @space_admin_station = space_admin_stations(:one)
  end

  test "visiting the index" do
    visit space_admin_stations_url
    assert_selector "h1", text: "Stations"
  end

  test "should create station" do
    visit space_admin_stations_url
    click_on "New station"

    fill_in "Area", with: @space_admin_station.area_id
    fill_in "Detail", with: @space_admin_station.detail
    fill_in "Name", with: @space_admin_station.name
    click_on "Create Station"

    assert_text "Station was successfully created"
    click_on "Back"
  end

  test "should update Station" do
    visit space_admin_station_url(@space_admin_station)
    click_on "Edit this station", match: :first

    fill_in "Area", with: @space_admin_station.area_id
    fill_in "Detail", with: @space_admin_station.detail
    fill_in "Name", with: @space_admin_station.name
    click_on "Update Station"

    assert_text "Station was successfully updated"
    click_on "Back"
  end

  test "should destroy Station" do
    visit space_admin_station_url(@space_admin_station)
    click_on "Destroy this station", match: :first

    assert_text "Station was successfully destroyed"
  end
end
