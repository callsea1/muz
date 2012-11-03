class SongRoomSongVersion < ActiveRecord::Base
  attr_accessible :song_room_id, :collaborator_id, :song_version_upload

  belongs_to :song_room

  has_attached_file :song_version_upload
end
