class CreateUserSongUploads < ActiveRecord::Migration
  def change
    create_table :user_song_uploads do |t|
      t.string :user_id
      t.has_attached_file :song

      t.timestamps
    end
  end
end
