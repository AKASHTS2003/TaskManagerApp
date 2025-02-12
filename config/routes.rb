Rails.application.routes.draw do
  devise_for :users
  resources :tasks

  # Calendar route (Correct one)
  get "calendar", to: "calendar#show"

  root to: "tasks#index"
end
