Rails.application.routes.draw do
  root 'tweets#index'
  get 'replies/create'
  devise_for :users
  resources :tweets do
    resource :likes, only: [:create, :destroy]
    resource :replies, only: [:create]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
