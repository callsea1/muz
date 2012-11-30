class RequestsController < ApplicationController
  before_filter :authenticate_user!

  def accept
    @collaborators = current_user.collaborators.find_by_id(params[:id])
    @collab_request.update_attributes(:accepted => true)
    redirect_to song_room_path(@collab_request.song_room_id)
  end

  def deny
    @collaborators = current_user.collaborators.find_by_id(params[:id])
    @collaborators.update_attributes(:accepted => false)

    respond_to do |format|
      format.html  redirect_to home_path 
    end
  end

end