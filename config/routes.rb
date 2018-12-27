Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages, only: [:index, :new, :create, :destroy]
end
