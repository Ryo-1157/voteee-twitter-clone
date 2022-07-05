Rails.application.routes.draw do
  # get 'likes/create'
  # get 'likes/destroy'
  # get 'tweets/index'
  # get 'tweets/show'
  # get 'tweets/new'
  # get 'tweets/create'
  # get 'users/index'
  # get 'users/show'
  root 'tweets#index'
  devise_for :users
  resources :tweets do
    resource :likes, only:[:create, :destroy]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
