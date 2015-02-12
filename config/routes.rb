Rails.application.routes.draw do
  resources :snippets, only: [:index, :new, :create, :show]
  resources :users, except: :index
end

