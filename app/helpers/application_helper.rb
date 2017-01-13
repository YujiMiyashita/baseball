module ApplicationHelper
  def profile_img(profile)
    if profile.avatar?
      image_tag(profile.avatar, alt: profile.nick_name, width: 50, height: 50)
    else
      if profile.image_url.present?
        image_tag(profile.image_url, alt: profile.nick_name, width: 50, height: 50)
      else
        image_tag("noimg.jpg", width: 50, height: 50)
      end
    end
  end
end
