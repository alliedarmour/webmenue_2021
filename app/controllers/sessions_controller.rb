class SessionsController < ApplicationController
  include SessionsHelper
  
  skip_before_action :authenticated_user, only: [:new, :create, :failure]
    
  def new; end

  def create
    if identity = Identity.find_from_auth_hash(auth_hash)
      if params[:remember_me] == "1"
        self.set_permanent_cookie = identity.user_id
      else
        self.set_session_cookie = identity.user_id
      end
      redirect_to dashboard_path
    end
  end

  def destroy
  end

  def failure
    redirect_to root_path, error: "Ungültige Anmeldedaten!"
  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end
end
