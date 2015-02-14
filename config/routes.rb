Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  resources :snippets


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create', as: 'new_sign_up'

  get 'votes/show', to: 'votes#show'
  post 'votes/create', to: 'votes#create'

  get 'stories/:id/upvote', to: 'votes#upvote', as: 'vote_up'
  get 'stories/:id/downvote', to: 'votes#downvote', as: 'vote_down'

  resources :users, only: [:show, :edit, :delete]
  get '/users/:id', to: 'users#update', as: 'users_update'

  resources :stories

  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end

