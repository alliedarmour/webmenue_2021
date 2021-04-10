require 'rails_helper'


RSpec.describe "Sessions", type: :request do
  describe "GET /sessions/new - login page" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /auth/identity/callback", type: :request do 

    context "login with valid credentials" do 
      before do 
        hash = setup_valid_auth_hash
        Rails.application.env_config["omniauth.auth"] = hash
        @user = User.create(first_name: "Test", last_name: "User")
        @identity = Identity.create(
          provider: hash[:provider], 
          id: hash[:uid], 
          user_id: @user.id,
          password: "password", 
          password_confirmation: "password"
        )
      end

      it "should set a session on successful login without remember_me" do 
        post auth_identity_callback_path, params: { remember_me: "0" }
        expect(session[:user_id]).to eq(@identity.user_id)
      end

      it "should set a signed cookie on successful login with remember_me" do 
        post auth_identity_callback_path, params: { remember_me: "1" }
        jar = ActionDispatch::Cookies::CookieJar.build(request, cookies.to_hash)
        expect(jar.signed[:user_id]).to eq(@identity.user_id)
      end

      it "should redirect to the dashboard on successful login" do 
        post auth_identity_callback_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(dashboard_path)
      end
    end

    context "failed login attempt" do 
      before do   
        hash = setup_invalid_auth_hash
        Rails.application.env_config["omniauth.auth"] = hash
      end

      it "should not set a session and redirect to root path when entering wrong credentials" do 
        get auth_failure_path
        expect(reseponse).to have_http_status(:redirect)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
