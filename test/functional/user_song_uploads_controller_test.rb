require 'test_helper'

class UserSongUploadsControllerTest < ActionController::TestCase
  setup do
    @user_song_upload = user_song_uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_song_uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_song_upload" do
    assert_difference('UserSongUpload.count') do
      post :create, user_song_upload: { user_id: @user_song_upload.user_id }
    end

    assert_redirected_to user_song_upload_path(assigns(:user_song_upload))
  end

  test "should show user_song_upload" do
    get :show, id: @user_song_upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_song_upload
    assert_response :success
  end

  test "should update user_song_upload" do
    put :update, id: @user_song_upload, user_song_upload: { user_id: @user_song_upload.user_id }
    assert_redirected_to user_song_upload_path(assigns(:user_song_upload))
  end

  test "should destroy user_song_upload" do
    assert_difference('UserSongUpload.count', -1) do
      delete :destroy, id: @user_song_upload
    end

    assert_redirected_to user_song_uploads_path
  end
end
