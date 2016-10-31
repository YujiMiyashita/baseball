class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to mypage_profile_path if @user == current_user
  end

  def mypage
    @user = current_user
    if @user.profile.nil?
      redirect_to new_profile_path, notice: 'プロフィールを投稿しましょう！'
    else
      render :show
    end
  end

  def new
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.present?
      redirect_to edit_profile_path
    else
      @profile = Profile.new
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to user_path(current_user), notice: 'プロフィールを更新しました'
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(profile_params)
      redirect_to user_path(current_user), notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:nick_name, :content, :back_image)
  end
end
