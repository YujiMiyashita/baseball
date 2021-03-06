class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook(request.env['omniauth.auth'], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    elsif @user.nil?
      redirect_to new_user_registration_url, notice: 'Facebookにメールアドレスが登録されていません'
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.find_for_google(request.env['omniauth.auth'], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
