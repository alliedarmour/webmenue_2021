module Rememberable
    def set_user_in_session(remember_me, user_id)
        remember_me == "1" ? self.set_permanent_cookie = user_id : self.set_session_cookie = user_id
    end

    private

    def set_permanent_cookie=(value)
        cookies.permanent.signed[:user_id] = value
    end

    def set_session_cookie=(value)
        session[:user_id] = value
    end
end
