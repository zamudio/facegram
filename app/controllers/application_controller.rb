class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?

    def logged_in?
        !current_user.nil?  
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
    end

    private

    def current_user
        @current_account ||= Account.find(session[:user_id]) if session[:user_id]
    end
end
