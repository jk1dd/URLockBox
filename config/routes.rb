Rails.application.routes.draw do

  root to: "links#index"

  resources :links, only: [:edit, :update]

  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update, :create]
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
