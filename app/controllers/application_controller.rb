class ApplicationController < ActionController::Base
    helper_method :logged_in?

    def logged_in?
        session[:user_id]
    end

    def redirect_user
        if !logged_in?
            redirect_to '/login'
        end
    end

    def current_user
        if logged_in?
            User.find(session[:id])
        end
    end
end
