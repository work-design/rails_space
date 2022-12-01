require 'test_helper'
class Space::Admin::DesksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @desk = desks(:one)
  end

  test 'index ok' do
    get url_for(controller: 'space/admin/desks')

    assert_response :success
  end

  test 'new ok' do
    get url_for(controller: 'space/admin/desks')

    assert_response :success
  end

  test 'create ok' do
    assert_difference('Desk.count') do
      post(
        url_for(controller: 'space/admin/desks', action: 'create'),
        params: { desk: { code: @space_admin_desk.code, height: @space_admin_desk.height, length: @space_admin_desk.length, name: @space_admin_desk.name, width: @space_admin_desk.width } },
        as: :turbo_stream
      )
    end

    assert_response :success
  end

  test 'show ok' do
    get url_for(controller: 'space/admin/desks', action: 'show', id: @desk.id)

    assert_response :success
  end

  test 'edit ok' do
    get url_for(controller: 'space/admin/desks', action: 'edit', id: @desk.id)

    assert_response :success
  end

  test 'update ok' do
    patch(
      url_for(controller: 'space/admin/desks', action: 'update', id: @desk.id),
      params: { desk: { code: @space_admin_desk.code, height: @space_admin_desk.height, length: @space_admin_desk.length, name: @space_admin_desk.name, width: @space_admin_desk.width } },
      as: :turbo_stream
    )

    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Desk.count', -1) do
      delete url_for(controller: 'space/admin/desks', action: 'destroy', id: @desk.id), as: :turbo_stream
    end

    assert_response :success
  end

end
