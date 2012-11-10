class Collaborator < ActiveRecord::Base
  attr_accessible :song_room_id, :user_id, :accepted
  belongs_to :song_room
  belongs_to :user
end
