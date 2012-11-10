class RequestsController < ApplicationController

	def accept
		collab_request = current_user.collaborators.find(params[:id])
	    collab_request.update_attributes(:accepted => true)
        @collab_request = collab_request
        if collab_request.accepted?
		    respond_to do |format|
				format.html { redirect_to home_path  }
		    end
	    end
	end

	def deny
		collab_request = current_user.collaborators.find(params[:id])
	    collab_request.update_attributes(:accepted => false)
        @collab_request = collab_request
	    respond_to do |format|
			format.html { redirect_to home_path  }
	    end
	end
end