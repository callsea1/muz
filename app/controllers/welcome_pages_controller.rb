class WelcomePagesController < ApplicationController
	before_filter :authenticate_user!

	def home
		@welcome = "Welcome to MusicMind-studio"
	end

end