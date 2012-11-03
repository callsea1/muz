class CreateSongRoomSongVersions < ActiveRecord::Migration
  def change
    create_table :song_room_song_versions do |t|
      t.integer :song_room_id
      t.integer :collaborator_id
      t.has_attached_file :song_version_upload

      t.timestamps
    end
  end
end
