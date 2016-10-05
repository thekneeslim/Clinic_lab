class Appointment < ApplicationRecord
  belongs_to :appointment_date
  belongs_to :time_table
  belongs_to :doctor
  belongs_to :patient
end
