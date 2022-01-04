require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'projects#index'
  get 'users/my_settings'

  devise_for :users

  resources :users
  resources :user_settings

  resources :comments

  resources :projects do
    resources :sponsor_proposals do
      get 'reject'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :regions, only: [:index]
      resources :spheres, only: [:index]
    end
  end
end
