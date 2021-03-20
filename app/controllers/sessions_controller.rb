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
      redirect_to user_path(@user)
    elsif @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to admin_path(@admin)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to welcome_path
  end

end
