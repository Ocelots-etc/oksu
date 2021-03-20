class AdminsController < ApplicationController

  before_action :set_admin, only: [:show, :update, :destroy, :edit]

  def new
    @admin = Admin.new 
  end

  def show
    @admin = current_admin
    # - In the users show page - @user is coming through with the params from current_admin 
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to admin_path(@admin)
    else
      redirect_to new_admin_path
    end
  end

  def index
    @admins = Admin.all
  end

  def update
  end

  def destroy
    @admin.destroy
    redirect_to welcome_path
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end

  def set_admin
    @admin = Admin.find_by_id(params[:id])
  end
end
