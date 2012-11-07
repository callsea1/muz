class CreateSongRooms < ActiveRecord::Migration
  def change
    create_table :song_rooms do |t|
      t.integer :user_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
