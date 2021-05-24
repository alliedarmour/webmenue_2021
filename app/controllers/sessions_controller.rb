class SessionsController < ApplicationController
  include Rememberable
  include LdapAuthenticable
  
  skip_before_action :authenticated_user, only: [:new, :create_from_ldap, :create_from_identity, :failure]
    
  def new 
    @ldap ||= false
  end

  def create_from_identity
    if identity = Identity.find_from_auth_hash(auth_hash)
      set_user_in_session(params[:remember_me], identity.user_id)
      redirect_to dashboard_path
    end
  end

  def create_from_ldap
    con = LdapConnector.instance
    if result = con.authenticate_credentials(username: params[:auth_key], password: params[:password])
      identity = find_or_create_identity(result.first)
      set_user_in_session(params[:remember_me], identity.user_id)
      redirect_to dashboard_path
    else
    end
  end

  def destroy
    reset_session
    cookies.delete(:user_id)
    redirect_to root_path
  end

  def failure
    redirect_to root_path, error: "Ungültige Anmeldedaten!"
  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end
end
