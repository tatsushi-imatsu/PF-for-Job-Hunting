Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  namespace :admins do
    resources :users, only: [:index, :show, :update, :edit, :destroy]
    resources :posts, only: [:index, :show, :destroy]
  end

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root to: 'homes#top'
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


end
