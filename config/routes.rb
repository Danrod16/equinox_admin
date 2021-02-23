Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :landlords
      resources :invoices
      resources :receipts
      resources :flats
      resources :incidents
      resources :bookings
      resources :tenants
      resources :deposits
      root to: "users#index"
    end
  devise_for :users
  root to: 'admin/users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
