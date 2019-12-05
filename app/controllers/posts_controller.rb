class PostsController < ApplicationController
    # helper_method :current_user
    # before_action :owned_post, only: [:edit, :update, :destroy]
    # before_action :redirect_user

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
        @user = find_user
        @post = Post.new(post_params)
        @post.assign_attributes(user_id: @user.id)
        @post.save
        redirect_to '/home'
    end

    def edit
        # @user = User.find(session[:user_id]) #
        # @post = Post.where(user_id: session[:user_id])
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find_by_id(params[:id])
        @post.update_attributes(post_params)
        redirect_to '/home'
    end

    def destroy
        @post = Post.find_by_id(params[:id])
        @post.destroy
        redirect_to '/home'
    end

    private

    def find_user
        User.find(session[:user_id])
    end

    def post_params
        params.require(:post).permit(:caption)
    end

    # def user_post
    #     @user = find_user
    #     post_params[:user_id] = @user.id
    # end

    # def owned_post
    #     unless current_user == @post.user
    #       flash[:alert] = "That post doesn't belong to you!"
    #       redirect_to root_path
    #     end
    # end
end
