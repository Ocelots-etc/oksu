class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]
  # before_action :set_current_user, only: [:update, :destroy, :edit]
  # before_action :redirect_if_not_admin, only: :index
  # before_action :set_user, only: :dashboard

  def new
    @user = User.new 
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
  end

  def update
    if current_user
      current_user.update(user_params)
      redirect_to dashboard_path, notice: "Your information was updated."
    else
      redirect_to edit_user_path
    end 
  end

  def edit
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
