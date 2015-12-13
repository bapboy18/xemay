Rails.application.routes.draw do

  root "reviews#index"

  get "signup"  => "users#new"

  get "static_pages/about"
  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"

  get    "dash"   => "dashboard#index"

  resources :reviews do
    resources :comments
  end
  resources :users
end
