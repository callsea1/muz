class SongRoom < ActiveRecord::Base
  attr_accessible :description, :user_id, :title, :public_or_private

  belongs_to :user 

  has_many :collaborators

  has_many :song_room_song_versions
end
