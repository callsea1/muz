class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :username, :password, :password_confirmation, :remember_me, :provider, :uid, :phone_number, :musical_title, :music_preference_1, :music_preference_2, :instrument_1, :instrument_2, :location

  has_attached_file :avatar

  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_reputation :votes, source: {reputation: :votes, of: :song_room_song_versions }, aggregated_by: :sum

  def voted_for?(song_room_song_version)
    evaluations.where(target_type: song_room_song_version.class, target_id: song_room_song_version.id).present?
  end


  # attr_accessible :title, :body
     # Setup accessible (or protected) attributes for your model

    #validates :image_url, allow_blank: true, format: {
     #    with: %r{\.(gif|jpg|png)$}i,
      #  message: 'is not correct.'
    #}

    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.nickname
        user.email = auth.info.email
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



end
