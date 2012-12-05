class VersionsController < ApplicationController
  before_filter :authenticate_user!
  def show
	@version = Version.find_by_id(params[:id])
  @comments = @version.comments.all
  @comment = @version.comments.build(params[:comment])
	  respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @song }
      end
	end

  def create
  	@version = current_user.versions.build(params[:version])

  	if @version.save
  		respond_to do |format|
  			format.html { redirect_to song_room_path(@version.song_room) }
  		end
  	end
  end

  def download
  	@song_room = SongRoom.find_by_id(params[:id])
    version = Version.find(params[:id])
    
    send_file  version.song_version_upload.path,
    :filename => version.song_version_upload_file_name,
                :type => version.song_version_upload_content_type,
    :disposition => 'attachment'
    flash[:notice] = "Your file has been downloaded"
  end

  def vote
	  value = params[:type] == "up" ? 1 : -1
	  @version = Version.find(params[:id])
	  @version.add_or_update_evaluation(:votes, value, current_user)
	  redirect_to :back, notice: "Thank you for voting"
  end
end