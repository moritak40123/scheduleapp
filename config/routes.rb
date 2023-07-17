Rails.application.routes.draw do
  devise_for :users
  get 'schedules/index'
  root to: "schedules#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :schedules, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
