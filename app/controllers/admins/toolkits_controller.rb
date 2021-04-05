class Admins::ToolkitsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @toolkit = @user.toolkit.new
  end

  def show
    @user = User.find(params[:user_id])
    @toolkit = @user.toolkit
  end

  def create
    @user = User.find(params[:user_id])
    @admin = current_admin
    @toolkit = @user.toolkit.new(toolkit_params)
    if @toolkit.save
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id]) 
    @toolkit = @user.toolkit
  end

  def update
    @user = User.find(params[:user_id]) 
    @toolkit = @user.toolkit
    if @user && @toolkit
      @user.toolkit.update(toolkit_params)
      redirect_to admins_user_path(@user)
    else
      redirect_to edit_admins_user_toolkit_path(@user)
    end 
  end

  private

  def toolkit_params
    params.require(:toolkit).permit(:id, :legal, :documents, :job, :housing, :financial, :childcare, :health, :user_id)
  end

end
