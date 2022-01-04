require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get 'check_lifetime', to: "projects#check_lifetime"

  root 'projects#index'
  get 'users/my_settings'

  devise_for :users

  resources :users
  resources :user_settings

  resources :comments

  resources :projects do
    resources :sponsor_proposals
  end

  namespace :api do
    namespace :v1 do
      resources :regions, only: [:index]
      resources :spheres, only: [:index]
    end
  end
end
