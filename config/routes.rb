Rails.application.routes.draw do
  root "sessions#new"
  
  # Omniauth routes
  post "/auth/:provider/callback", to: "sessions#create_from_identity", as: "auth_callback"
  post "/ldap_login", to: "sessions#create_from_ldap", as: "ldap_login"
  delete "/logout", to: "sessions#destroy"
  get "/auth/failure", to: "sessions#failure"

  get "/dashboard", to: "dashboard#index", as: :dashboard

  resource :config
    resource :ldap_config
    resource :app_config
end
