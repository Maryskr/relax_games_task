Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :dashboards, only: [:index, :new, :create, :edit]
  resources :user_dashboards
  resources :users, only: [:edit, :update]
end
