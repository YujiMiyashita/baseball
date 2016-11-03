module ApplicationHelper
  def profile_img(user)
    return image_tag(user.image_url, alt: user.user_name, width: 50, height: 50) if user.image_url?

    unless user.provider.blank?
      avatar = user.avatar
    else
      avatar = 'no_image.png'
    end
    image_tag(avatar, alt: user.user_name, width: 50, height: 50)
  end
end
