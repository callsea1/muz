class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
  def show
  	@user = User.find(params[:id])
  	@song_rooms = SongRoom.find_all_by_id(@user.collaborators.map(&:song_room_id))
  	@user_song_uploads = @user.user_song_uploads
  	@versions = @user.versions

  end
  
  def index
  	@users = User.all
  end
end