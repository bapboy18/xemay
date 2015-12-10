Rails.application.routes.draw do

  root "static_pages#home"

  get "signup"  => "users#new"

  get "static_pages/about"
  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"

  resources :users
  resources :reviews #, only: [:create, :destroy]

end
