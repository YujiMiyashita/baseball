Rails.application.routes.draw do
  
  #ルート
  root 'top#index'

  #登録, ログイン画面
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
