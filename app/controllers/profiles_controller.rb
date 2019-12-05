class ProfilesController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @posts = Post.where(user_id: session[:user_id])
    end
end
