Rails.application.routes.draw do
  get 'contact/new'
  get 'replies/new'
  get 'messages/new'
  get 'messages/show'
  get 'favorites/index'
  get 'reviews/new'
  get 'bookings/show'
  get 'bookings/new'
  get 'spaces/index'
  get 'spaces/show'
  get 'spaces/new'
  get 'users/show'

  mount Attachinary::Engine => "/attachinary"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :spaces do
    resources :bookings
  end

  resources :bookings, only: [] do
    resources :reviews
  end

  resources :spaces, only: [] do
    resources :favorites, only: [ :index, :new, :create, :destroy ]
  end

  resources :spaces, only: [] do
    resources :messages, only: [ :index, :show, :new, :create ]
      resources :replies, only: [ :new, :create ]
  end
end
