Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :spaces do
    resources :bookings
  end

  resources :bookings, only: [] do
    resources :reviews
  end

  resources :users, only: [] do
    resources :favorites, only: [ :index, :new, :create, :destroy ]
  end

  resources :spaces, only: [] do
    resources :messages, only: [ :index, :show, :new, :create ]
      resources :replies, only: [ :new, :create ]
  end
end
