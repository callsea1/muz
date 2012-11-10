class UserSongUploadsController < ApplicationController
  before_filter :authenticate_user!
  # GET /user_song_uploads
  # GET /user_song_uploads.json
  def index
    @user_song_uploads = UserSongUpload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_song_uploads }
    end
  end

  # GET /user_song_uploads/1
  # GET /user_song_uploads/1.json
  def show
    @user_song_upload = UserSongUpload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_song_upload }
    end
  end

  # GET /user_song_uploads/new
  # GET /user_song_uploads/new.json
  def new
    @user_song_upload = UserSongUpload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_song_upload }
    end
  end

  # GET /user_song_uploads/1/edit
  def edit
    @user_song_upload = UserSongUpload.find(params[:id])
  end

  # POST /user_song_uploads
  # POST /user_song_uploads.json
  def create
    @user_song_upload = current_user.user_song_uploads.build(params[:user_song_upload])

    respond_to do |format|
      if @user_song_upload.save
        format.html { redirect_to @user_song_upload, notice: 'User song upload was successfully created.' }
        format.json { render json: @user_song_upload, status: :created, location: @user_song_upload }
      else
        format.html { render action: "new" }
        format.json { render json: @user_song_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_song_uploads/1
  # PUT /user_song_uploads/1.json
  def update
    @user_song_upload = UserSongUpload.find(params[:id])

    respond_to do |format|
      if @user_song_upload.update_attributes(params[:user_song_upload])
        format.html { redirect_to @user_song_upload, notice: 'User song upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_song_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_song_uploads/1
  # DELETE /user_song_uploads/1.json
  def destroy
    @user_song_upload = UserSongUpload.find(params[:id])
    @user_song_upload.destroy

    respond_to do |format|
      format.html { redirect_to user_song_uploads_url }
      format.json { head :no_content }
    end
  end
end
