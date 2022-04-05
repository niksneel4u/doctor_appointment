class Appointment < ApplicationRecord
  belongs_to :doctor, -> { where('role_id = ?', 1) }, class_name: 'User'
  belongs_to :patient, -> { where('role_id = ?', 2) }, class_name: 'User'

  validate :check_doctor_availability_at_date
  validate :check_doctor_availability_at_time
  validate :check_doctor_existing_appointment

  private

  def check_doctor_availability_at_time
    return if doctor.availabilities.where(
      '? BETWEEN start_time AND end_time', start_time
    ).where('? BETWEEN start_time AND end_time', end_time).present?

    errors.add(:start_time, "Dr #{doctor.firstname} not available on this time")
  end

  def check_doctor_existing_appointment
    doctor.doctor_appointments.each do |appointment|
      next unless (start_time..end_time).overlaps?(appointment.start_time..appointment.end_time)

      errors.add(:start_time, "Dr. #{doctor.firstname} has an appointment at this time with some other patient")
      break
    end
  end

  def check_doctor_availability_at_date
    return if doctor.availabilities.where('DATE(start_time) = ?', start_time.to_date).present?

    errors.add(:start_time, "Dr #{doctor.firstname} is not available on this date")
  end
end
