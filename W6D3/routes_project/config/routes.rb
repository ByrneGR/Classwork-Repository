Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users/:id', to: 'users#show', as: 'user'
  # get '/users', to: 'users#index'
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # get '/users/:id/edit', to: 'users#edit'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  
  
  
  
  
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
    member do
      get 'favorites', to: 'users#favorites'

    end  
  end  
  resources :artworks, only: [:index, :show, :create, :update, :destroy] do
    resources :comments, only: [:index]
    resources :likes, only: [:index]
    member do
      patch 'favorites', to: 'artworks#add_favorites'
    end  
  end

  resources :artwork_shares, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy] do
    resources :likes, only: [:index]
  end
  
  resources :likes, only: [:create, :destroy]


end
