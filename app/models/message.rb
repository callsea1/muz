class Message < ActiveRecord::Base
  attr_accessible :content, :user_id

  belongs_to :user
  belongs_to :version
end
