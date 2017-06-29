Rails.application.routes.draw do
  get 'actors/index'

  get 'sessions/new'

  root 'static_pages#home'
  get  '/help',      to: 'static_pages#help'
  get  '/about',     to: 'static_pages#about'
  get  '/contactpage',   to: 'static_pages#contact'
  get  '/signup',    to: 'users#new'
  post '/signup',    to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  
#  get '/movies',     to: 'movies#index', as: "movies"
#  get '/movies/new', to: 'movies#new'
#  post '/movies/create', to: 'movies#create'
#  get '/movies/:id',  to: 'movies#show'
#  get 'movies/:id/edit', to: 'movies#edit'
#  patch 'movies/:id', to: 'movies#update'
#  delete 'movies/:id', to: 'movies#destroy'
  
  resources :movies
  
#  get '/actors',     to: 'actors#index'
#  get '/actors/new',  to: 'actors#new'
#  post '/actors/create', to: 'actors#create'
#  get '/actors/:id',  to: 'actors#show'
#  get '/actors/:id/edit', to: 'actors#edit'
#  patch 'actors/:id/', to: 'actors#update'
  
  resources :actors
  
  resources :contacts
  
end