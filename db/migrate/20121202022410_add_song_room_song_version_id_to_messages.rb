class AddSongRoomSongVersionIdToMessages < ActiveRecord::Migration
  def change
  	add_column	  :messages, :song_room_version_id, :integer
  end
end
