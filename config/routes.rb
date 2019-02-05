Rails.application.routes.draw do

  devise_for :users

  get '/steps', to: 'steps#step_1'
  get '/steps/step_2', to: 'steps#step_2'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :routes, only: [:new, :index, :show]

end
