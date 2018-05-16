class CreateEmployeeSessionEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_session_events do |t|
      t.integer :id_employee
      t.date :workday
      t.integer :id_system
      t.integer :id_event
      t.integer :importance
      t.time :eventtime

      t.timestamps
    end
  end
end
