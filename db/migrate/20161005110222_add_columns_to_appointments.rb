class AddColumnsToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :appointment_date, foreign_key: true
    add_reference :appointments, :time_table, foreign_key: true
  end
end
