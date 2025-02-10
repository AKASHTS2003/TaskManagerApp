Rails.application.routes.draw do
  devise_for :users

  # Define the route for the tasks index page (viewing tasks)
  resources :tasks

  root to: "tasks#index"  # Redirect to the tasks index page after login
end
