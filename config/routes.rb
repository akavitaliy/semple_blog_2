Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:show, :index]
  get 'posts/index'
  root 'posts#index'
  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :categories, except: [:show]
    resources :posts, except: [:show, :index]
  end
end
