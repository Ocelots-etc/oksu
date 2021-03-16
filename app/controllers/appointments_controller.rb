class AppointmentsController < ApplicationController
before_action :set_appt, only: [:show, :create]

  def new
    @appt = Appointment.new
  end

  def show

  end

  def create
    @appt = Appointment.new(appt_params)
      
    if @appt.save
        redirect_to appointment_path(@appt)
      else
        redirect_to new_appointment_path
      end
  end

  def index
    @appts = Appointment.all
  end

  def edit

  end

  def destroy

  end

  private

    def set_appt
      @appt = Appointment.find_by_id(params[:id])
    end

    def appt_params
      params.require(:appointment).permit(:location, :comments, :datetime)
    end
end
