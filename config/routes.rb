Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :favorites, only: [ :index ]

  resources :profiles

  resources :spaces do
    resources :bookings
  end

  resources :spaces, only: [] do
    resources :amenities
  end

  resources :spaces, only: [] do
    resources :activities
  end

  resources :bookings, only: [] do
    resources :reviews
  end

  resources :spaces, only: [] do
    resources :favorites, only: [ :new, :create, :destroy ]
  end

  resources :spaces, only: [] do
    resources :messages, only: [ :index, :show, :new, :create ]
      resources :replies, only: [ :new, :create ]
  end

  resources :bookings, only: [] do
    resources :payments, only: [:new, :create]
  end
end
