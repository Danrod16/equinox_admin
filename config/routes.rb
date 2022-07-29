class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end

Rails.application.routes.draw do
  resources :companies, only: [:new, :create]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations',
    confirmations: 'users/confirmations'
  }
  get "/company", to: "companies#find", as: :find_company
  post "/company", to: "companies#join", as: :join_company

  authenticated :user do
    root to: 'settings#dashboard', as: :user_root
  end

  root to: "pages#home"
  constraints SubdomainConstraint do
    resources :companies do
      resources :company_user, path: :users, module: :companies
    end

    get 'setting', to: "settings#setting", as: :setting
    put 'update_user', to: "settings#update_user", as: :update_user
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
      resources :custom_invoices
      root to: "users#index"
    end
    resources :document_templates
    resources :bookings
    resources :incidents
    resources :deposits, only: [:create]
    resources :landlords do
      collection do
        post :import
      end
    end
    resources :invoices
    resources :tenants
    resources :flats do
      collection do
        post :import
      end
    end

    resources :statistics, only: [:index]
    get "/booking_pdf", to: "pdf#booking_pdf"
    get "/invoice_pdf", to: "pdf#invoice_pdf"
    get "/incident_pdf", to: "pdf#incident_pdf"
    get "/settlement_pdf", to: "pdf#settlement_pdf"
    get "/custom_invoice_pdf", to: "pdf#custom_invoice_pdf"
    get "/receipt_pdf", to: "pdf#receipt_pdf"
    get "/landlord_csv", to: "pdf#generate_landlord_csv", :defaults => { :format => 'csv' }
    get '/styleguide', to: "pages#styleguide"
  end
    post "/update_language", to: "pages#set_language", as: :set_language
end
