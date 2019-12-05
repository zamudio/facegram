class ProfilesController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @posts = Post.all
    end
end