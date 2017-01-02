Rails.application.routes.draw do

  #ルート
  root 'normal/users#mypage'

  #登録, ログイン画面
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :normal do
    #フォローフォロワー
    resources :tribes, only: [:create, :destroy]


    #ユーザ一覧
    resources :users, only: [:index, :show] do
      get :get_player, on: :collection
    end
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

      resources :invitations, only: [:create, :destroy]
    end

    #投票
    namespace :vote do
      resources :pennant_races
      resources :rankings
    end

    #観戦日記
    resources :blogs

    #個人トーク機能
    resources :personal_talks do
      resources :personal_talk_messages
    end

    #グループトーク機能
    resources :group_talks do
      resources :group_talk_messages
      resources :group_talk_members, only: [:new, :create, :destroy]
      patch :invite, on: :member
    end

    #個人トーク開始
    resources :personal_talk_members, only: [:create, :destroy]

    #お気に入り
    resources :favorites, only: [:create, :destroy]
  end




  devise_for :administrators

  namespace :admin do
    #座席登録
    resources :seats

    #球団登録・選手登録
    resources :teams do
      resources :players
    end

  
  end

  #letter_opener
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
