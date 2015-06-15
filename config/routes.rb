Rails.application.routes.draw do
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users, only: [:show]
  resources :ideas
  root :to => "ideas#index"
end
