class WelcomePagesController < ApplicationController
	#before_filter :authenticate_user!

	def home
	  @welcome = "Welcome to MusicMind-studio"
    @current_user_song_rooms = current_user.song_rooms.all
	  @collab_requests = Collaborator.where(:user_id => current_user.id)
	end
	
	def index
	end
	
end