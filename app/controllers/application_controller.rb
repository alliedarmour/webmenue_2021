class ApplicationController < ActionController::Base
    include Authentication
    helper_method :current_user, :logged_in?

    add_flash_types :info, :error, :warning
end
