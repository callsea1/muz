class SongRoomSongVersionsController < ApplicationController
  before_filter :authenticate_user!
  def show
	@song_room_song_version = SongRoomSongVersion.find_by_id(params[:id])
  @comments = @song_room_song_version.comments.all
  @comment = @song_room_song_version.comments.build(params[:comment])
	  respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @song }
      end
	end

  def create
  	@song_room_song_version = current_user.song_room_song_versions.build(params[:song_room_song_version])

  	if @song_room_song_version.save
  		respond_to do |format|
  			format.html { redirect_to song_room_path(@song_room_song_version.song_room) }
  		end
  	end
  end

  def download
  	@song_room = SongRoom.find_by_id(params[:id])
    song_room_song_version = SongRoomSongVersion.find(params[:id])
    
    send_file  song_room_song_version.song_version_upload.path,
    :filename => song_room_song_version.song_version_upload_file_name,
                :type => song_room_song_version.song_version_upload_content_type,
    :disposition => 'attachment'
    flash[:notice] = "Your file has been downloaded"
  end

  def vote
	  value = params[:type] == "up" ? 1 : -1
	  @song_room_song_version = SongRoomSongVersion.find(params[:id])
	  @song_room_song_version.add_or_update_evaluation(:votes, value, current_user)
	  redirect_to :back, notice: "Thank you for voting"
  end
end