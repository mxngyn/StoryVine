Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  resources :snippets

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create', as: 'new_sign_up'

  patch 'stories/:id/upvote', to: 'votes#upvote', as: 'vote_up'
  delete '/vote/:id', to: 'votes#destroy', as: 'vote_delete'

  resources :users, only: [:show, :edit, :update, :delete]

  resources :stories

  resources :tags
  get '/tags/:id/stories', to: 'tags#show', as: 'tags_show'
  # get '/stories/:id/tags', to: 'stories#show_tags', as: 'show_tags'
  resources :storytags

  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end

