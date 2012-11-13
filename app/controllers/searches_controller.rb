class SearchesController < ApplicationController

	def index
	    if params[:query].present?
	    @search_users = User.search(params)
	    @search_song_rooms = SongRoom.search(params)

	    end
	    respond_to do |format|
	      format.html # index.html.erb
	      format.js
	    end
    end
end