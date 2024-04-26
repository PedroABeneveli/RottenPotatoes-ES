Rails.application.routes.draw do

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  get '/movies' => 'movies#index', :as => 'movies'
  get '/movies/:id/new' => 'movies#new', :as => 'new_movie'
  post '/movies' => 'movies#create', :as => 'create_movie'
  get '/movies/:id' => 'movies#show', :as => 'movie'
  #get 'movies/:id/edit' => 'movies#edit', :as => 'edit_movie'
  #put '/movies/:id' => 'movies#update', :as => 'movie'

  root 'movies#index'
end
