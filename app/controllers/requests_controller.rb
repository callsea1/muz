class RequestsController < ApplicationController
	before_filter 

	def accept
		collab_request = Collaborator.find_by_id(params[:id])
		if collab_request.user != current_user
			redirect_to home_path 
			return
		end
	    collab_request.update_attributes(:accepted => true)
        @collab_request = collab_request
		redirect_to song_room_path(@collab_request.song_room_id)
	end

	def deny
		collab_request = Collaborator.find_by_id(params[:id])
		if collab_request.user != current_user
			redirect_to home_path 
			return
		end
		
	    collab_request.update_attributes(:accepted => false)
        @collab_request = collab_request
	    respond_to do |format|
			format.html  redirect_to home_path 
	    end
	end
end