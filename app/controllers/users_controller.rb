class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create

  end

  def index
    @users = User.all
  end

  def edit

  end

  def destroy

  end


end
