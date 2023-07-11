Rails.application.routes.draw do
  get 'schedules/index'
  root to: "schedules#index"
end
