class AppointmentsController < ApplicationController
  TOKEN = 'test'.freeze # we can use jwt to for batter security

  def create
    @appointment = Appointment.new(appointments_params)
    @appointment.save ? success_responses : error_response
  end

  private

  def error_response
    render json: {
      status: 'error',
      message: @appointment.errors.messages.values.join(', ')
    }
  end

  def success_responses
    render json: {
      status: 'success',
      message: 'appointment created successfully'
    }
  end

  def appointments_params
    params.require(:appointment).permit(
      :start_time, :end_time, :doctor_id, :patient_id
    )
  end
end
