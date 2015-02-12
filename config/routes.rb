Rails.application.routes.draw do
  resources :snippets, only: [:index, :new, :create, :show]
  resources :users, except: :index

  get 'votes/show', to: 'votes#show'
  post 'votes/create', to: 'votes#create'
end

