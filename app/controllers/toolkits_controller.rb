class ToolkitsController < ApplicationController

  before_action :set_toolkit, only: [:show, :update, :destroy, :edit]

  def new
    @tool = Toolkit.new 
  end

  def show
  end

  def create
    @tool = current_user.build_toolkit(toolkit_params)
    if @tool.save
      session[:toolkit_id] = @tool.id
      redirect_to user_path(current_user)
    else
      redirect_to new_toolkit_path
    end
  end

  def index
    @tools = Toolkit.all
  end

  def edit
  end

  def update
    if @tool
      current_user.toolkit.update(toolkit_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_toolkit_path
    end 
  end


  def destroy
    @tool.destroy
    redirect_to welcome_path
  end

  private

  def toolkit_params
    params.require(:toolkit).permit(:id, :legal, :documents, :job, :housing, :financial, :childcare, :health, :user_id)
  end

  def set_toolkit
    @tool = Toolkit.find_by(id: params[:id])
  end
end
