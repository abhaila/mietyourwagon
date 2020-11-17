Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :bookings
  end
  resources :bookings, only: [:destroy]
end
