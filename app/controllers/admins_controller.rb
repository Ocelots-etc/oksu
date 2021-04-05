class AdminsController < ApplicationController

  before_action :set_admin, only: [:update, :destroy, :edit]
  before_action :redirect_if_not_admin, only: [:dashboard, :update, :destroy, :edit]

  def new
    @admin = Admin.new 
  end

  def dashboard
    @users = User.all
    @admin = current_admin
        # - In the users show page - @user is coming through with the params from current_admin 
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to admin_dashboard_path
    else
      redirect_to new_admin_path
    end
  end

  def edit

  end

  def index
    @admins = Admin.all
  end

  def update
    if @admin
      @admin.update(admin_params)
      redirect_to admin_dashboard_path, notice: "Your Admin was updated."
    else
      redirect_to edit_admin_path
    end
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
