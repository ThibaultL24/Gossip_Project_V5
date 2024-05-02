class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Vous êtes maintenant connecté."
      else
        flash.now[:alert] = "Adresse e-mail ou mot de passe incorrect."
        redirect_to login_path
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Vous êtes maintenant déconnecté."
    end
  end