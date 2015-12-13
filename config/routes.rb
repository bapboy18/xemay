Rails.application.routes.draw do
  get 'users/show'

  get 'users/new'

  get 'static_pages/home'

  get 'static_pages/about'

  resources :users
end
