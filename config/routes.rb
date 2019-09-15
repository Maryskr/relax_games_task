Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :dashboards, except: :destoy
  resources :user_dashboards
  resources :users, only: [:edit, :update]
end
