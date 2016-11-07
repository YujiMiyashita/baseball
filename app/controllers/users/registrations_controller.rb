class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_string
    super
  end

  def create
    super
    User.build_profile(resource)
  end
end
