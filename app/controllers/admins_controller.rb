class AdminsController < ApplicationController

  def new

  end

  def show
    @admin = Admin.find_by_id(params[:id])
  end

  def create

  end

  def index
    @admins = Admin.all
  end

  def edit

  end

  def destroy

  end

end
