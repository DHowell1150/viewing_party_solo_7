Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'

  resources :users, only: [:show, :create] do
    resources :movies, only: [:index], as: 'movies'
    get '/discover', to: 'movies#search', as: 'discover_movie'
  end

  # resources :movies, only: [:search] do
  #   get '/search', to: 'movies#search', as: 'discover_movie_path'
  # end
  # get '/users/:id/discover', to: 'users#discover', as: 'discover_user_path'
end
