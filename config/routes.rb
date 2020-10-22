Rails.application.routes.draw do
  
  root "users#index"
  resources :users, only: [:new, :create, :show]
  get "signup" => "users#new"
  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
end
