class AppointmentsController < ApplicationController

  before_action :set_appt, only: [:show, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :update, :destroy, :edit]

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
    @appt = Appointment.new(appt_params)
    if @appt.save
        redirect_to user_path(@user)
      else
        redirect_to new_appointment_path
      end
  end

  def index
    @appts = current_user.appointments
  end

  def edit
    # @appt = Appointment.find_by(id: params[:id])
  end

  def update
    if @appt
      @appt.update(appt_params)
      redirect_to user_path(@user)
    end 
  end

  def destroy
    @appt.destroy
    redirect_to welcome_path
  end

  private

    def set_appt
      @appt = Appointments.find_by_id(params[:id])
    end

    def appt_params
      params.require(:appointment).permit(:location, :comments, :datetime, :admin_id)
    end
end
