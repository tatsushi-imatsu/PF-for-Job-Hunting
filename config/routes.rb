Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  namespace :admins do
    resources :users, only: [:index]
    resources :posts, only: [:index]
  end

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root to: 'homes#top'
  get "/admins" => "admins/homes#top"

  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
