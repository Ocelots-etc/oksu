module ApplicationHelper

  # def redirect_if_not_logged_in
  #   if !logged_in_admin? || !logged_in_user?
  #     redirect_to welcome_path
  #   end
  # end

  def logged_in_admin?
    !!current_admin
  end

  def logged_in_user?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  def set_admin
    @admin = Admin.find_by_id(params[:id])
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
  
end
