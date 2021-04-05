class Admins::AppointmentsController < ApplicationController

  before_action :set_admin_appt, only: [:show, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :update, :destroy, :edit]
  before_action :redirect_if_not_admin, only: :index

  def new
    @admin_appt = current_admin.appointments.new
    # @user = User.find_by(id: params[:id])
  end

  def show
    # @appt = Appointment.find_by(id: params[:id])

  end

  def create
    @users = User.all
    @admin = current_admin
    @admin_appt = current_admin.appointments.new(admin_appt_params)
    if @admin_appt.save
       redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def index
    @admin_appts = Appointment.all
  end

  def edit
    # @appt = Appointment.find_by(id: params[:id])
  end

  def update
    if @admin_appt
      @admin_appt.update(admin_appt_params)
      redirect_to dashboard_path
    end 
  end

  def destroy
    @admin_appt.destroy
    redirect_to welcome_path
  end

  private

    def set_admin_appt
      @admin_appt = Appointment.find_by_id(params[:id])
    end

    def admin_appt_params
      params.require(:appointment).permit(:location, :comments, :appt_datetime, :admin_id, :user_id)
    end


end