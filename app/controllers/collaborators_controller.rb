class CollaboratorsController < ApplicationController

	def new
		@collaborator = Collaborator.new

		respond_to do |format|
			format.html
			format.js
			format.json { render json: @collaborator }
		end
	end

	def create
	  @collaborator = Collaborator.new
	  @collaborator.song_room_id = params[:song_room_id]
	  @collaborator.user_id = params[:user_id]
      @collaborator.save
	  respond_to do |format|
	      if @collaborator.save
	        format.html { redirect_to song_room_path(@collaborator.song_room_id), notice: 'Collaborator was successfully added.' }
	        format.json { render json: @collaborator.song_room_id, status: :created, location: @collaborator }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
	      end
      end
	end
	
	def destroy
    @collaborator = Collaborator.find(params[:id])
    @collaborator.destroy

    respond_to do |format|
      format.html { redirect_to song_room_path(@collaborator.song_room_id), notice: "Collaborator deleted" }
      format.json { head :no_content }
    end
  end

end