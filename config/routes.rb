Rails.application.routes.draw do
  root "events#index"

  get "events/filter/:filter" => "events#index", as: :filtered_events
  resources :users, only: [:new, :create, :show]
  get "signup" => "users#new"
  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  resources :events
end
