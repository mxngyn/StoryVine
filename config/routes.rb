Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'



  resources :snippets, except: :create

  get '/snippets/:id/stories/:id/stories/:id', to: 'stories#create_nested_story', as: 'child_story'


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create', as: 'new_sign_up'

  patch '/upvote/:id', to: 'votes#upvote', as: 'vote_up'
  delete '/vote/:id', to: 'votes#destroy', as: 'vote_delete'

  resources :users, only: [:show, :edit, :update, :delete]

  get 'stories/search', to: 'stories#search', as: 'stories_search'

  resources :stories, except: :create
  get '/stories/:id/new', to: 'stories#create_nested_story', as: 'new_nested_story'
  resources :stories


  resources :tags
  get '/tags/:id/stories', to: 'tags#show', as: 'tags_show'

  resources :storytags

  root "welcome#index"

  get '/login', to: 'sessions#new'
  get '/dashboard', to: 'sessions#show', as: 'dashboard'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  patch 'snippets/:id/flag', to: 'snippets#flag', as: 'snippet_flag'
  patch 'stories/:id/flag', to: 'stories#flag', as: 'story_flag'

end

