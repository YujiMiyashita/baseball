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

  def self.find_for_facebook(auth, sign_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid) || User.find_by(email: auth.info.email)

    unless user
      user = User.new(
        user_name: auth.extra.raw_info.name,
        provider:  auth.provider,
        uid:       auth.uid,
        email:     auth.info.email,
        avatar:    auth.info.image,
        password:  Devise.friendly_token[0, 20]
      )
      user.skip_confirmation!
      user.save(validate: false)
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
          image_url: auth.info.image,
          password:  Devise.friendly_token[0, 20]
      )
      user.skip_confirmation!
      user.save(validate: false)
    end
    user
  end

  def favorite?(user)
    favorites.find_by(to_user_id: user.id)
  end

  def self.create_string
    SecureRandom.uuid
  end

  def update_with_password(params, *options)
    params.delete :current_password
    update_without_password(params, *options)
  end
end
