class RenameSongRoomSongVersionToVersion < ActiveRecord::Migration
    def change
        rename_table :song_room_song_versions, :versions
    end 
end
