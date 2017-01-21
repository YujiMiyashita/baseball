class Normal::FavoritesController < NormalController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to normal_blogs_path, notice: "#{@favorite.blog.user.profile.nick_name}さんのブログをお気に入り登録しました"
  end

  def destroy
    @favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
    redirect_to normal_blogs_path, alert: "#{@favorite.blog.user.profile.nick_name}さんのブログをお気に入り解除しました"
  end
end
