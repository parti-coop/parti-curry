Rails.application.routes.draw do
  root 'notices#index'
  resources :notices
end
