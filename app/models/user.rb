class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  has_one :profile

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

  def self.create_string
    SecureRandom.uuid
  end

  def update_with_password(params, *options)
    params.delete :current_password
    update_without_password(params, *options)
  end
end
