class PostsController < ApplicationController
    before_action :redirect_user

    def index
        #all posts from a user
    end

    def show
        #show a specific post from a user
    end

    def new
        #create a new post
    end

    def create
        #create a new post
    end

    def destroy
        #delete post, maybe?
    end

    private

    def find_user
        User.find(session[:user_id])
    end

    def user_post
        @user = find_user
        post_params[:user_id] = @user.id
    end
    
    def post_params
        params.require(:post).permit(:user_id, :caption, :comment_id)
    end
end
