Rails.application.routes.draw do
  root 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  resources :comments, only: %i[show index create edit update destroy]
  resources :listings, only: %i[index show new create] do
    resources :rentals, shallow: true
    resources :comments, shallow: true
  end
  resources :users, only: %i[new create show] do
    resources :addresses do
      resources :listings, shallow: true
    end
  end
  resources :addresses, only: %i[show index create]
  resources :rentals
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end