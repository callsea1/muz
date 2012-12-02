class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :song_room_song_version
  attr_accessible :body, :song_room_song_version_id, :user_id
end
