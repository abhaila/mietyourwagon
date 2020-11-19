Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :bookings, only: [:new, :create]
    # changed it from universal resources to only new and create as needed
    resources :reviews, only: [ :new, :create ]
  end
  resources :bookings, except: [:new, :create]
end
