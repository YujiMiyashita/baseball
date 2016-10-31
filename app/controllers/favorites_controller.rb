class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(to_user_id: params[:favorite][:to_user_id])
    redirect_to users_url, notice: "#{@favorite.to_user.user_name}さんをお気に入り登録しました"
  end

  def destroy
    @favorite = current_user.favorites.find_by(to_user_id: params[:favorite][:to_user_id])destroy
    redirect_to users_url, notice: "#{@favorite.to_user.user_name}さんをお気に入り解除しました"
  end
end
