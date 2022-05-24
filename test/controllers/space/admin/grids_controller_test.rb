require 'test_helper'
class Space::Admin::GridsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @grid = grids(:one)
  end

  test 'index ok' do
    get url_for(controller: 'space/admin/grids')

    assert_response :success
  end

  test 'new ok' do
    get url_for(controller: 'space/admin/grids')

    assert_response :success
  end

  test 'create ok' do
    assert_difference('Grid.count') do
      post(
        url_for(controller: 'space/admin/grids', action: 'create'),
        params: { grid: { code: @space_admin_grid.code, floor: @space_admin_grid.floor, height: @space_admin_grid.height, length: @space_admin_grid.length, name: @space_admin_grid.name, width: @space_admin_grid.width } },
        as: :turbo_stream
      )
    end

    assert_response :success
  end

  test 'show ok' do
    get url_for(controller: 'space/admin/grids', action: 'show', id: @grid.id)

    assert_response :success
  end

  test 'edit ok' do
    get url_for(controller: 'space/admin/grids', action: 'edit', id: @grid.id)

    assert_response :success
  end

  test 'update ok' do
    patch(
      url_for(controller: 'space/admin/grids', action: 'update', id: @grid.id),
      params: { grid: { code: @space_admin_grid.code, floor: @space_admin_grid.floor, height: @space_admin_grid.height, length: @space_admin_grid.length, name: @space_admin_grid.name, width: @space_admin_grid.width } },
      as: :turbo_stream
    )

    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Grid.count', -1) do
      delete url_for(controller: 'space/admin/grids', action: 'destroy', id: @grid.id), as: :turbo_stream
    end

    assert_response :success
  end

end
