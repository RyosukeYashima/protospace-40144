Rails.application.routes.draw do
  root to: 'prototypes#index'
  devise_for :users
  get 'prototypes/index'
  resources :prototypes, only: [:create, :new, :show, :edit, :update, :destroy] do
    resources :comments, only: :create

  end
  resources :users, only: :show
end
