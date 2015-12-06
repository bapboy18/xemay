Rails.application.routes.draw do
  get "signup"  => "users#new"

  get "static_pages/home"

  get "static_pages/about"
  resources :users
end
