Rails.application.routes.draw do


  root to: 'gossips#index'

  get '/profil', to: 'users#edit', as: :profil
  patch '/profil', to: 'users#update'

  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  get '/team', to: 'static_pages#team', as: :team
  get '/contact', to: 'static_pages#contact', as: :contact

  resources :users, only: [:new, :create, :show]
  resources :cities, only: [:index, :show]
  resources :gossips do
    resources :comments
  end
  
end
