require "application_system_test_case"

class GridsTest < ApplicationSystemTestCase
  setup do
    @space_admin_grid = space_admin_grids(:one)
  end

  test "visiting the index" do
    visit space_admin_grids_url
    assert_selector "h1", text: "Grids"
  end

  test "should create grid" do
    visit space_admin_grids_url
    click_on "New grid"

    fill_in "Code", with: @space_admin_grid.code
    fill_in "Floor", with: @space_admin_grid.floor
    fill_in "Height", with: @space_admin_grid.height
    fill_in "Length", with: @space_admin_grid.length
    fill_in "Name", with: @space_admin_grid.name
    fill_in "Width", with: @space_admin_grid.width
    click_on "Create Grid"

    assert_text "Grid was successfully created"
    click_on "Back"
  end

  test "should update Grid" do
    visit space_admin_grid_url(@space_admin_grid)
    click_on "Edit this grid", match: :first

    fill_in "Code", with: @space_admin_grid.code
    fill_in "Floor", with: @space_admin_grid.floor
    fill_in "Height", with: @space_admin_grid.height
    fill_in "Length", with: @space_admin_grid.length
    fill_in "Name", with: @space_admin_grid.name
    fill_in "Width", with: @space_admin_grid.width
    click_on "Update Grid"

    assert_text "Grid was successfully updated"
    click_on "Back"
  end

  test "should destroy Grid" do
    visit space_admin_grid_url(@space_admin_grid)
    click_on "Destroy this grid", match: :first

    assert_text "Grid was successfully destroyed"
  end
end
