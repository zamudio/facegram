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

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end



    # def index
    #     @users = User.all
    # end

    # def show
    #     @user = user_find
    # end

    # def new
    #     @user = User.new
    # end

    # def create
    #     @user = User.new(user_params)

    #     if @user.save
    #         session[:user_id] = @user.id
    #         redirect_to '/home'
    #     else
    #         redirect_to '/signup'
    #     end
    # end

    # def edit
    #     @user = user_find
    # end

    # def update
    #     @user = user_find
    #     @user.update(user_params)
    #     redirect_to '/home'
    # end

    # def destroy
    #     @user = user_find
    # end

    # private

    # def user_params
    #     params.require(:user).permit(:name, :username, :password, :password_confirmation)
    # end

    # def user_find
    #     User.find(params[:username])
    # end
end
