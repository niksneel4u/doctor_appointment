class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :doctor, foreign_key: { to_table: :users }
      t.references :patient, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
