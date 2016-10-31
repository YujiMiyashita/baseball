Rails.application.routes.draw do

  get 'tribes/create'

  get 'tribes/destroy'

  #ルート
  root 'top#index'
  #登録, ログイン画面
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  #ユーザ一覧
  resources :users, only: [:index, :show]
  #プロフィール変更
  resource :profile, controller: :users, only: [:new, :create, :edit, :update] do
    get :mypage, on: :collection
  end

  #お気に入り
  resources :favorites, only: [:create, :destroy]

  #letter_opener
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
