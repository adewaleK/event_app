Rails.application.routes.draw do
  devise_for :users
  root 'public#index'
  resources :events
end
