class RemoveColumnFromAppointments < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :date_id, :string
    remove_column :appointments, :time_id, :string
  end
end
