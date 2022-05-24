require 'test_helper'
class Space::Admin::StationsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @station = stations(:one)
  end

  test 'index ok' do
    get url_for(controller: 'space/admin/stations')

    assert_response :success
  end

  test 'new ok' do
    get url_for(controller: 'space/admin/stations')

    assert_response :success
  end

  test 'create ok' do
    assert_difference('Station.count') do
      post(
        url_for(controller: 'space/admin/stations', action: 'create'),
        params: { station: { area_id: @space_admin_station.area_id, detail: @space_admin_station.detail, name: @space_admin_station.name } },
        as: :turbo_stream
      )
    end

    assert_response :success
  end

  test 'show ok' do
    get url_for(controller: 'space/admin/stations', action: 'show', id: @station.id)

    assert_response :success
  end

  test 'edit ok' do
    get url_for(controller: 'space/admin/stations', action: 'edit', id: @station.id)

    assert_response :success
  end

  test 'update ok' do
    patch(
      url_for(controller: 'space/admin/stations', action: 'update', id: @station.id),
      params: { station: { area_id: @space_admin_station.area_id, detail: @space_admin_station.detail, name: @space_admin_station.name } },
      as: :turbo_stream
    )

    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Station.count', -1) do
      delete url_for(controller: 'space/admin/stations', action: 'destroy', id: @station.id), as: :turbo_stream
    end

    assert_response :success
  end

end
