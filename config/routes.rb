Rails.application.routes.draw do
  root "workouts#index"

  get "about", to: "pages#about"

  resources :workouts, only: [:index, :show]
  resources :exercises, only: [:index, :show]
  resources :categories, only: [:index, :show]
end