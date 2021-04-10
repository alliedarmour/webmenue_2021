Rails.application.routes.draw do
  root "sessions#new"
  
  # Omniauth routes
  post "/auth/identity/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"

  get "/dashboard", to: "dashboard#index", as: :dashboard
end
