class AppointmentsController < ApplicationController

  before_action :set_appt, only: [:show, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :update, :destroy, :edit]
  before_action :redirect_if_not_admin, only: :index

  # before_action :redirect_if_not_logged_in

  def new
    @appt = Appointment.new
    @user = User.find_by(id: params[:id])
  end

  def show
    # @appt = Appointment.find_by(id: params[:id])
  end

  def create
    @admins = Admin.all
    @user = User.find_by(id: params[:id])
    @appt = current_user.appointments.new(appt_params)
    if @appt.save && current_admin
      redirect_to admin_dashboard_path
    elsif current_admin
      render :"/admins/appointments/new" 
    elsif @appt.save && current_user
      redirect_to dashboard_path
    else current_user
      render :new
    end
  end

  def index
    @appts = Appointment.all
  end

  def edit
    # @appt = Appointment.find_by(id: params[:id])
  end

  def update
    if @appt
      @appt.update(appt_params)
      redirect_to dashboard_path
    end 
  end

  def destroy
    @appt.destroy
    redirect_to welcome_path
  end

  private

    def set_appt
      @appt = Appointment.find_by_id(params[:id])
    end

    def appt_params
      params.require(:appointment).permit(:location, :comments, :appt_datetime, :admin_id, :user_id)
    end

    # def datetime_cannot_be_in_the_past
    #   if datetime.present? && datetime < datetime.today
    #   end
    # end

end
