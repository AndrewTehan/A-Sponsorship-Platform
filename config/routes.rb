# frozen_string_literal: true

Rails.application.routes.draw do
  root 'projects#index'

  resources :projects

  devise_for :users
  get 'users/index'

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
