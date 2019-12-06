class PostsController < ApplicationController
    helper_method :current_user
    before_action :redirect_user

    def index
        @posts = Post.All
    end

    def show
        @post = post_find
    end

    def new
        @post = Post.new
    end

    def create
        @user = current_user
        @post = Post.new(post_params)
        @post.assign_attributes(user_id: @user.id)

        if @post.save
            redirect_to '/home'
        else
            redirect_to new_post_path
        end
    end

    def edit
        @post = post_find
    end

    def update
        @post = post_find
        @post.update_attributes(post_params)
        redirect_to '/home'
    end

    def destroy
        @post = post_find
        @post.destroy
        redirect_to '/home'
    end

    def likes
        # liking from post sends you back to home
        @post = post_find
        @post.increment!(:likes_count)
        redirect_to '/home'
    end

    private

    def post_params
        params.require(:post).permit(:caption, :image, :likes_count)
    end

    def post_find
        Post.find(params[:id])
    end
end
