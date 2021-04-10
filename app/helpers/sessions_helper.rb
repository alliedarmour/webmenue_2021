module SessionsHelper
    def set_permanent_cookie=(value)
        cookies.permanent.signed[:user_id] = value
    end

    def set_session_cookie=(value)
        session[:user_id] = value
    end
end
