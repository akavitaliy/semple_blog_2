Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'posts/index'
  root 'posts#index'
  resources :tags, only: [:show]
  resources :categories
end
