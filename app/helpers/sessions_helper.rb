module SessionsHelper
  def logout
    session.delete(:user_id)
    @current_user = nil
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    unless session[:user_id]
      flash[:error] = "Vous devez être connecté pour accéder à cette page."
      redirect_to login_path
    end
  end
end
