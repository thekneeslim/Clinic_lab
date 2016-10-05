class Doctor < ApplicationRecord
  has_many :appointments
  belongs_to :specialty

  has_many :patients, -> { distinct }, through: :appointments
  has_many :appointment_dates, -> { distinct }, through: :appointments
  has_many :time_tables, -> { distinct }, through: :appointments


end
