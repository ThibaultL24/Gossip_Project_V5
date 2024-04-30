class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end
    
    def index
      @users = User.all
      @gossips = []
      @users.each do |user|
        @gossips << user.gossips
      end
      @gossips.flatten! # Pour aplatir le tableau multidimensionnel
    end
  end