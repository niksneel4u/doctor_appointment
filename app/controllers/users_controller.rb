class UsersController < ApplicationController
  def doctor_list
    @available_doctors = User.doctors.joins(:availabilities).where('start_time >= ?', Time.now.utc).order('availabilities.start_time')
    binding.pry
    render json: {
      doctors: @available_doctors += User.doctors.where.not(id: @available_doctors.pluck(:id))
    }
  end

  def doctor_available_on_date
    @doctors = User.doctors.joins(:availabilities).where(
      'DATE(start_time) = ?', params['date'].to_date
    )
    render json: {
      doctors: @doctors
    }
  end
end

