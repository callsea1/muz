class SongRoomSongVersion < ActiveRecord::Base
  attr_accessible :song_room_id, :user_id, :song_version_upload

  belongs_to :song_room
  belongs_to :user

  has_attached_file :song_version_upload

  has_reputation :votes, source: :user, aggregated_by: :sum
end
