class User < ApplicationRecord
  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id', dependent: :destroy
  has_many :patient_appointments, class_name: 'Appointment', foreign_key: 'patient_id', dependent: :destroy
  belongs_to :role
  has_many :availabilities, class_name: 'Availability', foreign_key: 'doctor_id', dependent: :destroy

  scope :doctors, -> { where(role_id: 1) }
end
