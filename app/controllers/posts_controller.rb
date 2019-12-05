class PostsController < ApplicationController
    # before_action :redirect_user

    def index
        #all posts from a user
        @user = find_user
        @posts = Post.where(user_id: session[:user_id])
    end

    def show
        #show a specific post from a user
        @post = Post.find(params[:id])
        session[:post_id] = @post.id
    end

    def new
        #create a new post
        @post = Post.new
    end

    def create
        #create a new post
        @post = Post.new(user_post)
        if @post.save
            render :index
        else
            render :new
        end
    end

    # def destroy
    #     #delete post, maybe?
    # end

    private

    def find_user
        User.find(session[:user_id])
    end

    def user_post
        @user = find_user
        post_params[:user_id] = @user.id
    end
    
    def post_params
        params.require(:post).permit(:user_id, :caption)
    end
end
