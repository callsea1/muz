class SongRoomSongVersionsController < ApplicationController
  before_filter :authenticate_user!
  def show
	@song_room_song_version = SongRoomSongVersion.find_by_id(params[:id])
	  respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @song }
      end
	end

  def vote
	  value = params[:type] == "up" ? 1 : -1
	  @song_room_song_version = SongRoomSongVersion.find(params[:id])
	  @song_room_song_version.add_or_update_evaluation(:votes, value, current_user)
	  redirect_to :back, notice: "Thank you for voting"
  end
end