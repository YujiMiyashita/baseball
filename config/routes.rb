Rails.application.routes.draw do
  #ルート
  root 'top#index'

  #球団登録
  resources :teams

  #フォローフォロワー
  resources :tribes, only: [:create, :destroy]

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

  resources :tickets, except: [:create] do
    get :draft_index, on: :collection
    get :draft, on: :member
    post :draft_create, on: :collection
    patch :registration, on: :member
  end

  #お気に入り
  resources :favorites, only: [:create, :destroy]

  #letter_opener
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
