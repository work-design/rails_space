require 'test_helper'
class Space::Admin::RoomsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @room = rooms(:one)
  end

  test 'index ok' do
    get url_for(controller: 'space/admin/rooms')

    assert_response :success
  end

  test 'new ok' do
    get url_for(controller: 'space/admin/rooms')

    assert_response :success
  end

  test 'create ok' do
    assert_difference('Room.count') do
      post(
        url_for(controller: 'space/admin/rooms', action: 'create'),
        params: { room: { code: @space_admin_room.code, floor: @space_admin_room.floor, name: @space_admin_room.name } },
        as: :turbo_stream
      )
    end

    assert_response :success
  end

  test 'show ok' do
    get url_for(controller: 'space/admin/rooms', action: 'show', id: @room.id)

    assert_response :success
  end

  test 'edit ok' do
    get url_for(controller: 'space/admin/rooms', action: 'edit', id: @room.id)

    assert_response :success
  end

  test 'update ok' do
    patch(
      url_for(controller: 'space/admin/rooms', action: 'update', id: @room.id),
      params: { room: { code: @space_admin_room.code, floor: @space_admin_room.floor, name: @space_admin_room.name } },
      as: :turbo_stream
    )

    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Room.count', -1) do
      delete url_for(controller: 'space/admin/rooms', action: 'destroy', id: @room.id), as: :turbo_stream
    end

    assert_response :success
  end

end
