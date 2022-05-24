require 'test_helper'
class Space::Admin::BuildingsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @building = buildings(:one)
  end

  test 'index ok' do
    get url_for(controller: 'space/admin/buildings')

    assert_response :success
  end

  test 'new ok' do
    get url_for(controller: 'space/admin/buildings')

    assert_response :success
  end

  test 'create ok' do
    assert_difference('Building.count') do
      post(
        url_for(controller: 'space/admin/buildings', action: 'create'),
        params: { building: { code: @space_admin_building.code, name: @space_admin_building.name } },
        as: :turbo_stream
      )
    end

    assert_response :success
  end

  test 'show ok' do
    get url_for(controller: 'space/admin/buildings', action: 'show', id: @building.id)

    assert_response :success
  end

  test 'edit ok' do
    get url_for(controller: 'space/admin/buildings', action: 'edit', id: @building.id)

    assert_response :success
  end

  test 'update ok' do
    patch(
      url_for(controller: 'space/admin/buildings', action: 'update', id: @building.id),
      params: { building: { code: @space_admin_building.code, name: @space_admin_building.name } },
      as: :turbo_stream
    )

    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Building.count', -1) do
      delete url_for(controller: 'space/admin/buildings', action: 'destroy', id: @building.id), as: :turbo_stream
    end

    assert_response :success
  end

end
