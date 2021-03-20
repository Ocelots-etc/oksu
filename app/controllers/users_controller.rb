class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]
  before_action :set_user, only: [:show, :update, :destroy, :edit]

  def new
    @user = User.new 
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def index
    @users = User.all
  end

  def update
    if @user
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path
    end 
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to welcome_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end


end
