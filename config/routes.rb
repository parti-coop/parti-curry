Rails.application.routes.draw do
  root 'notices#index'
  resources :notices
  get 'schedules', to: 'schedules#index'
end
