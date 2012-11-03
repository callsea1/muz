class UserSongUpload < ActiveRecord::Base
  attr_accessible :user_id, :song
  
  has_attached_file :song

  belongs_to :user
end
