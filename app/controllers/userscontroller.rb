class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @gossips = @user.gossips
    end
    
    def index
        @users = User.all
    end
end