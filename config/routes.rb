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
    collection do
      get :draft_index
      post :draft_create
    end

    member do
      get :draft
      get :draft_edit
      patch :registration
    end

  end

  #お気に入り
  resources :favorites, only: [:create, :destroy]

  #letter_opener
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
