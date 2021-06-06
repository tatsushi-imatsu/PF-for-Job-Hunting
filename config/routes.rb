Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }
  namespace :admins do
    resources :users, only: [:index, :show, :update, :edit, :destroy]
    resources :posts, only: [:index, :show, :destroy]
    get 'search' => 'searches#search'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }
  root to: 'homes#top'
  get "home/about" => "homes#about"
  get "/admins" => "admins/homes#top"

  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

  resource :relationships, only: [:create, :destroy, :show]
  resources :users do
    get :followings, on: :member
    get :followers, on: :member
  end

  patch "/users/:id/hide" => "users#hide", as: 'users_hide'
  get "/users/:id/withdraw" => "users#withdraw", as: "user_withdraw"
  get "/search" => "searches#search"


  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

  resources :notifications, only: [:index]

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  # Refileの画像投稿時に404を返さないようにする記述
    mount Refile.app, at: Refile.mount_point, as: :refile_app
  # どこにも当てはまらないPath（例外処理）
    get '*not_found' => 'application#render_404'
   

end
