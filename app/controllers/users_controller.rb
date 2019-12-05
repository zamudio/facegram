class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            redirect_to '/signup'
        end
    end

    def edit
        @user = User.find(params[:id])
        session[:user_id] = @user.id
    end

    def update
        @user = User.find_by_id(params[:id])
        @user.update_attributes(edit_user_params)
        redirect_to '/home'
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to '/login'
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

    def edit_user_params
        params.require(:user).permit(:name, :username)
    end
end
