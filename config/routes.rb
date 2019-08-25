Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: 'tweets#index'
  resources :users, only: [:show]
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
end
