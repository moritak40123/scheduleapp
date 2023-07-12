Rails.application.routes.draw do
  devise_for :users
  get 'schedules/index'
  root to: "schedules#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create] do
    resources :schedules, only: [:index, :create]
  end
end
