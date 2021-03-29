Rails.application.routes.draw do
  get 'statistics/index'
  get 'pdf/booking_pdf'
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
      resources :settlements
      root to: "users#index"
    end
  resources :statistics, only: [:index]
  get "/booking_pdf", to: "pdf#booking_pdf"
  get "/invoice_pdf", to: "pdf#invoice_pdf"
  get "/incident_pdf", to: "pdf#incident_pdf"
  get "/settlement_pdf", to: "pdf#settlement_pdf"
  devise_for :users
  root to: 'admin/users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
