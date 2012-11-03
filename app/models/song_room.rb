class SongRoom < ActiveRecord::Base
  attr_accessible :description, :user_id

  belongs_to :user 

  has_many :collaborators

  has_many :song_room_song_versions
end
