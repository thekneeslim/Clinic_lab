class CreateAppointmentDates < ActiveRecord::Migration[5.0]
  def change
    create_table :appointment_dates do |t|
      t.date :date

      t.timestamps
    end
  end
end
