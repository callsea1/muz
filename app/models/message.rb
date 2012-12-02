class Message < ActiveRecord::Base
  attr_accessible :content, :user_id, :song_room_song_version_id

  belongs_to :user
  belongs_to :song_room_song_version
end
