class SessionsController < ApplicationController
    def login       # new
    end

    def create
        @user = User.find_by(username: params[:username])

        if @account && @account.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/home'     # user_path => user#show?
        else
            flash[:message] = "Oops! That login wasn't quite right... Try again!"
            render :login       # '/login'
    end

    def logout      # destroy
        session.clear
        redirect_to login__path     # '/login'
    end

    def current_user
        @user = User.find(session[:user_id])
    end
end
