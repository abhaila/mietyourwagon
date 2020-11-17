Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users do
    resources :bookings
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars
  resources :bookings, only: [:destroy]
end
