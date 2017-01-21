class Normal::UsersController < NormalController
  before_action :authenticate_user!
  before_action :set_profile, only: [:new, :edit, :update]

  def index
    @users = User.index_all.page(params[:page])
  end

  def show
    user = User.find(params[:id])
    @profile = user.profile
    redirect_to mypage_normal_profile_path if @profile.user == current_user
  end

  def mypage
    @profile = current_user.profile
    @notifications = current_user.notifications
    @group_talks = current_user.group_talks
    @favorite_blogs = current_user.favorite_blogs
    render :show
  end

  def new
    if @profile.present?
      redirect_to edit_normal_profile_path
    else
      @profile = Profile.new
    end
  end

  def create
    @profile = current_user.profile.build(profile_params)
    if @profile.save
      redirect_to normal_user_path(current_user), notice: 'プロフィールを更新しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to normal_user_path(current_user), notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  def get_player
    render partial: 'player_select', locals: { team_id: params[:team_id] }
  end

  private

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def profile_params
    params.require(:profile).permit(:nick_name, :content, :back_image, :team_id, :ballpark_id, :player_id, :avatar, :avatar_cache)
  end
end
