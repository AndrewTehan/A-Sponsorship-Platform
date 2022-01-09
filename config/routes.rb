require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'users#home'
  get 'users/settings'
  get '/home', to: 'users#home'
  get '/about', to: 'users#about'
  get '/user_comments', to: 'users#user_comments'
  get '/user_projects', to: 'users#user_projects'
  get '/user_proposals', to: 'users#user_proposals'

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
