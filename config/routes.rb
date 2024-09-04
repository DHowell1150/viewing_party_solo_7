Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'welcome#index'
  get '/register', to: 'users#new', as: 'register_user'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  
  resources :users, only: [:show, :create] do
    get '/discover', to: 'discover#index', as: 'discover_movie'
    # post '/movies', to: 'movies#index'
    resources :movies, only: [:index, :show, :create]
  end
end
