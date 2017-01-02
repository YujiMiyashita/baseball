class Normal::TribesController < NormalController
  before_action :authenticate_user!

  def create
    @tribe = current_user.tribes.create(followed_id: params[:tribe][:followed_id])
    redirect_to users_url, notice: "#{@tribe.followed.user_name}さんをフォローしました"
  end

  def destroy
    @tribe = current_user.tribes.find_by(followed_id: params[:tribe][:followed_id]).destroy
    redirect_to users_url, notice: "#{@tribe.followed.user_name}さんをリムりました"
  end
end
