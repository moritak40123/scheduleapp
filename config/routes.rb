Rails.application.routes.draw do
  devise_for :users
  get 'schedules/index'
  root to: "schedules#index"
  resources :users, only: [:edit, :update]
  resources :rooms do
    resources :schedules, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :candidates, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
