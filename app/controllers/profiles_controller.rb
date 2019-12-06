class ProfilesController < ApplicationController
    helper_method :current_user
    before_action :redirect_user

    def index
        @user = current_user
        @posts = Post.all
    end
end