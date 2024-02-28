Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  resources :prototypes 
  delete 'users/sign_out', to: 'devise/sessions#destroy'
  root to: 'prototypes#index'
end
