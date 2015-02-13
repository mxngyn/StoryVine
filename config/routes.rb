Rails.application.routes.draw do
  resources :snippets, only: [:index, :new, :create, :show]


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get 'votes/show', to: 'votes#show'
  post 'votes/create', to: 'votes#create'

  resources :users, only: [:show, :edit, :update, :delete]

  resources :stories


  root "welcome#index"
end

