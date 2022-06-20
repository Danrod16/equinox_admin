class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end

Rails.application.routes.draw do
  devise_for :users

  constraints SubdomainConstraint do
    root to: 'settings#dashboard'
    resources :bookings
    resources :incidents
    resources :deposits, only: [:create]
    resources :landlords
    resources :invoices
    resources :tenants
    resources :flats
    resources :statistics, only: [:index]
    get 'statistics/index'
    get 'pdf/booking_pdf'
    get "/booking_pdf", to: "pdf#booking_pdf"
    get "/invoice_pdf", to: "pdf#invoice_pdf"
    get "/incident_pdf", to: "pdf#incident_pdf"
    get "/settlement_pdf", to: "pdf#settlement_pdf"
    get "/custom_invoice_pdf", to: "pdf#custom_invoice_pdf"
    get "/receipt_pdf", to: "pdf#receipt_pdf"
    get "/landlord_csv", to: "pdf#generate_landlord_csv", :defaults => { :format => 'csv' }
    get '/styleguide', to: "pages#styleguide"

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
      resources :custom_invoices
      root to: "users#index"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
