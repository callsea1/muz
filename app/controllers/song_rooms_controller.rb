class SongRoomsController < ApplicationController
  before_filter :authenticate_user!
  # GET /song_rooms
  # GET /song_rooms.json
  def index
    @song_rooms = SongRoom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @song_rooms }
    end
  end

  # GET /song_rooms/1
  # GET /song_rooms/1.json
  def show
    @song_room = SongRoom.find(params[:id])
    @song_room_song_versions = SongRoomSongVersion.find_with_reputation(:votes, :all, order: "votes desc")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song_room }
    end
  end

  # GET /song_rooms/new
  # GET /song_rooms/new.json
  def new
    @song_room = SongRoom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song_room }
    end
  end

  # GET /song_rooms/1/edit
  def edit
    @song_room = SongRoom.find(params[:id])
  end

  # POST /song_rooms
  # POST /song_rooms.json
  def create
    @song_room = current_user.song_room.build(params[:song_room])

    respond_to do |format|
      if @song_room.save
        format.html { redirect_to @song_room, notice: 'Song room was successfully created.' }
        format.json { render json: @song_room, status: :created, location: @song_room }
      else
        format.html { render action: "new" }
        format.json { render json: @song_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /song_rooms/1
  # PUT /song_rooms/1.json
  def update
    @song_room = SongRoom.find(params[:id])

    respond_to do |format|
      if @song_room.update_attributes(params[:song_room])
        format.html { redirect_to @song_room, notice: 'Song room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_rooms/1
  # DELETE /song_rooms/1.json
  def destroy
    @song_room = SongRoom.find(params[:id])
    @song_room.destroy

    respond_to do |format|
      format.html { redirect_to song_rooms_url }
      format.json { head :no_content }
    end
  end
end
