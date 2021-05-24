module Authentication
    extend ActiveSupport::Concern 

    included do 
        before_action :authenticated_user
    end

    private

    def authenticated_user 
        if authenticated_user = get_user_from_session
            Current.user = authenticated_user
        else
            redirect_to root_path
        end
    end

    def current_user
        ActiveDecorator::Decorator.instance.decorate(get_user_from_session)
    end

    def logged_in?
        current_user.present?
    end

    protected 

    def get_user_from_session
        if user = User.find_by(id: cookies.permanent.signed[:user_id])
            @current_user = user
        else
            @current_user = User.find_by(id: session[:user_id])
        end
    end
end