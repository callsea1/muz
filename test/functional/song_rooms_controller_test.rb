require 'test_helper'

class SongRoomsControllerTest < ActionController::TestCase
  setup do
    @song_room = song_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_room" do
    assert_difference('SongRoom.count') do
      post :create, song_room: { description: @song_room.description, user_id: @song_room.user_id }
    end

    assert_redirected_to song_room_path(assigns(:song_room))
  end

  test "should show song_room" do
    get :show, id: @song_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_room
    assert_response :success
  end

  test "should update song_room" do
    put :update, id: @song_room, song_room: { description: @song_room.description, user_id: @song_room.user_id }
    assert_redirected_to song_room_path(assigns(:song_room))
  end

  test "should destroy song_room" do
    assert_difference('SongRoom.count', -1) do
      delete :destroy, id: @song_room
    end

    assert_redirected_to song_rooms_path
  end
end
