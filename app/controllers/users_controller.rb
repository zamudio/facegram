class UsersController < ApplicationController
    helper_method :current_user
    before_action :redirect_user, except: [:new, :create]

    def show
        @posts = Post.all
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            # flash message
            redirect_to '/signup'
        end
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        @user.update_attributes(edit_user_params)
        # @user.avatar.attach(params[:avatar])
        redirect_to '/home'
        # else
        #     redirect_to edit_post_path
        # end
    end

    # def destroy
    #     # @user = User.find(params[:id])
    #     @user = current_user
    #     @user.destroy
    #     redirect_to '/login'
    # end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :bio, :avatar)
    end

    def edit_user_params
        params.require(:user).permit(:name, :username, :bio, :avatar)
    end
end
