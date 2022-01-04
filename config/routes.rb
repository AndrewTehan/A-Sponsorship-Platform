Rails.application.routes.draw do
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
