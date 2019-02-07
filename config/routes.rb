Rails.application.routes.draw do

  devise_for :users

  get '/step_1', to: 'steps#step_1'
  get '/step_2', to: 'steps#step_2'
  get '/step_3', to: 'steps#step_3'
  root to: 'pages#home'
  get 'dashboard', to: 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :requests, only: [:index, :show]
  resources :routes, only: [:create, :index, :show, :destroy]
  resources :stores, only: [:index]

end
