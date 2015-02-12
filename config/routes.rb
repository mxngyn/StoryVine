Rails.application.routes.draw do
  resources :snippets, only: [:index, :new, :create, :show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users, only: [:show, :edit, :update, :delete]
end

