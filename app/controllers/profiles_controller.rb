class ProfilesController < ApplicationController
    helper_method :current_user
    before_action :redirect_user

    def index
        # @user = User.find(session[:user_id])
        @user = current_user
        @posts = Post.all
    end
end