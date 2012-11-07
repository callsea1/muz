class Collaborator < ActiveRecord::Base
  attr_accessible :song_room_id, :user_id

  belongs_to :song_room
end
