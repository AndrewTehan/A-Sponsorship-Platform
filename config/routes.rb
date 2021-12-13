# frozen_string_literal: true

Rails.application.routes.draw do
  root "projects#index"
  
  resources :projects

  devise_for :users
  get 'users/index'
  get 'regions/index'
end
