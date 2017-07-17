Rails.application.routes.draw do

  root to: "links#index"

  resources :links, only: [:index]

  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'

  resources :users

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
