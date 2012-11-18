class SongRoomSongVersion < ActiveRecord::Base
  attr_accessible :song_room_id, :user_id, :song_version_upload

  belongs_to :song_room
  belongs_to :user

  has_many :comments

  has_attached_file :song_version_upload
  validates :song_version_upload, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :song_version_upload

  has_reputation :votes, source: :user, aggregated_by: :sum

  include Tire::Model::Search
  include Tire::Model::Callbacks
 
  def self.search(params)
    tire.search(load: true) do
      query { string params[:query] } if params[:query].present?
    end
  end
end
