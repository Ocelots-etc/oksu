module ApplicationHelper

  def redirect_if_not_admin
    if !logged_in_admin? 
      redirect_to welcome_path
    end
  end

  def redirect_if_not_current_user(object)
    if current_user != object.user
      redirect_to welcome_path
    end
  end

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

  def admin_dashboard_button
    if current_admin
      button_to("Your Dashboard", admin_dashboard_path, method: :get)
    end
  end
end
