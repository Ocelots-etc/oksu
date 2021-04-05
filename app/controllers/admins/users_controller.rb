class Admins::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      redirect_to admins_user_path(@user), notice: "Your information was updated."
    else
      redirect_to edit_admins_user_path(@user)
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end



end