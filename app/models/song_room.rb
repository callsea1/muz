class SongRoom < ActiveRecord::Base
  attr_accessible :description, :user_id, :title, :public_or_private

  belongs_to :user 

  has_many :collaborators

  has_many :versions

  include Tire::Model::Search
  include Tire::Model::Callbacks
 
  def self.search(params)
    tire.search(load: true) do
      query { string params[:query] } if params[:query].present?
    end
  end
end
