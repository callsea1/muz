class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :song_room_song_version_id
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
