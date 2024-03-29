class User < ActiveRecord::Base
  attr_accessible :email, :name, :first_name, :last_name, :image, :username, :password, :password_confirmation, :remember_me, :provider, :uid, :phone_number, :musical_title, :music_preference_1, :music_preference_2, :instrument_1, :instrument_2, :location
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  
  has_many :messages

  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_many :comments

  has_many :song_rooms

  has_many :user_song_uploads

  has_many :collaborators

  has_many :versions

  has_reputation :votes, source: {reputation: :votes, of: :versions }, aggregated_by: :sum

  def voted_for?(version)
    evaluations.where(target_type: version.class, target_id: version.id).present?
  end


  # attr_accessible :title, :body
     # Setup accessible (or protected) attributes for your model

    #validates :image_url, allow_blank: true, format: {
     #    with: %r{\.(gif|jpg|png)$}i,
      #  message: 'is not correct.'
    #}

    include Tire::Model::Search
    include Tire::Model::Callbacks

    def self.search(params)
    tire.search do
        query { string params[:query] } if params[:query].present?
      end
    end

    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.nickname
        user.email = auth.info.email
        user.name = auth.info.name
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.location = auth.info.location
        user.image = "http://graph.facebook.com/#{user.uid}/picture?type=square"
      end
    end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def registration_complete?
    if
      self.music_preference_1.present?
      self.music_preference_2.present?
      self.musical_title.present?
      self.instrument_1.present?
      self.instrument_2.present?
    end
  end

  def music_preferences 
    ["Avant-Garde","Blues","Children's","Classical","Comedy/Spoken","Country","Easy Listening","Electronic","Folk","Holiday",
      "International","Jazz","Latin","New Age","Pop/Rock","R&B","Rap","Reggae","Religious","Stage & Screen","Vocal"]
  end
end
