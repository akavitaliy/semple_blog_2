Rails.application.routes.draw do
  resources :posts
  get 'posts/index'
  root 'posts#index'
end
