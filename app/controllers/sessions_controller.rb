class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            # flash[:alert] = "Oops! That login wasn't quite right... Try again!"
            redirect_to '/login'
        end
    end

    def logout
        session.delete :user_id
        redirect_to login_path
    end
end