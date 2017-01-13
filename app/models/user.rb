class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  #プロフィール
  has_one :profile, dependent: :destroy
  #お気に入り
  has_many :favorites, foreign_key: 'from_user_id', dependent: :destroy
  has_many :reverse_favorites, foreign_key: 'to_user_id', class_name: 'Favorite', dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :to_user
  has_many :favorited, through: :reverse_favorites, source: :from_user
  #フォローフォロワー
  has_many :tribes, foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_tribes, foreign_key: 'followed_id', class_name: 'Tribe', dependent: :destroy
  has_many :followed_users, through: :tribes, source: :followed
  has_many :followers, through: :reverse_tribes, source: :follower

  #グループトーク
  has_many :group_talk_members
  has_many :group_talks, through: :group_talk_members
  has_many :group_talk_messages, dependent: :destroy
  #個人トーク
  has_many :personal_talk_members
  has_many :personal_talks, through: :personal_talk_members
  has_many :personal_talk_messages, dependent: :destroy
  #チケット
  has_many :tickets, dependent: :destroy
  #ブログ
  has_many :blogs, dependent: :destroy
  #順位予想
  has_many :pennant_races

  #チケット申し込み
  has_many :offers, dependent: :destroy, class_name: 'Offer', dependent: :destroy
  has_many :offer_tickets, through: :offers, source: :ticket

  #チケット申込み履歴
  has_many :offer_histories, class_name: 'OfferHistroy', dependent: :destroy
  has_many :offer_ticket_histories, through: :offer_histories, source: :ticket

  scope :index_all, -> {
    select(:id, :user_name, :created_at)
    .order(created_at: :asc)
    .includes(:profile)
  }

  paginates_per 20

  enum status: { general: 0, admin: 1 }


  def self.find_for_facebook(auth, sign_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid) || User.find_by(email: auth.info.email)

    unless user
      user = User.new(
        user_name: auth.extra.raw_info.name,
        provider:  auth.provider,
        uid:       auth.uid,
        email:     auth.info.email,
        image_url:    auth.info.image,
        password:  Devise.friendly_token[0, 20])

      user.skip_confirmation!
      user.save(validate: false)
      User.build_profile(user)
    end
    user
  end

  def self.find_for_google(auth, sign_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid) || User.find_by(email: auth.info.email)

    unless user
      user = User.new(
          user_name: auth.info.name,
          provider:  auth.provider,
          uid:       auth.uid,
          email:     auth.info.email,
          image_url:    auth.info.image,
          password:  Devise.friendly_token[0, 20])

      user.skip_confirmation!
      user.save(validate: false)
      User.build_profile(user)
    end
    user
  end

  def self.build_profile(user)
    profile = Profile.new(
      nick_name: user.user_name,
      user_id:   user.id,
      image_url: user.image_url,
      ballpark_id: 1,
      team_id: 1)

    profile.save
  end

  def favorite?(user)
    favorites.find_by(to_user_id: user.id).present?
  end

  def follow?(user)
    tribes.find_by(followed_id: user.id).present?
  end

  def self.create_string
    SecureRandom.uuid
  end

  def update_with_password(params, *options)
    params.delete :current_password
    update_without_password(params, *options)
  end
end
