class WelcomePagesController < ApplicationController
	before_filter :authenticate_user!

	def home
		@welcome = "Welcome to MusicMind-studio"
		@current_user_song_rooms = "Your song rooms"
		
	end

end