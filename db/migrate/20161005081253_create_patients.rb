class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.boolean :admin

      t.timestamps
    end
  end
end
