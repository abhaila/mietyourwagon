Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :bookings, except: [:destroy]
  end
  resources :bookings, only: [:destroy]
end
