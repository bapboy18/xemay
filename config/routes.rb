Rails.application.routes.draw do

  root "reviews#index"

  get "signup"  => "users#new"

  get "static_pages/about"
  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"

  resources :reviews do
    resources :comments
    resources :addresses
  end
  resources :users
end
