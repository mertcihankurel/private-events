Rails.application.routes.draw do
  root "events#index"
  resources :users, only: [:new, :create, :show]
  get "signup" => "users#new"
  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  resources :events
end
