class SessionsController < ApplicationController

  
  def new
    @user = User.new
    @admin = Admin.new
  end

  def welcome
    @admin = Admin.find_by(id: params[:id])
  end

  def create
    @admin = Admin.find_by(email: params[:email])
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    elsif @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to admin_dashboard_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to welcome_path
  end

  def omniauth
    @user = User.find_with_omniauth(auth)
    @admin = Admin.find_with_omniauth(auth)
    if @user 
      session[:user_id] = @user.id
      redirect_to dashboard_path
    elsif @admin 
      session[:admin_id] = @admin.id
      redirect_to admin_dashboard_path
    else
      redirect_to login_path, notice: 'You were not able to log in.'
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
