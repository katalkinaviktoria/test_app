class CreateEmployeeSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_sessions do |t|
      t.integer :id_employee
      t.date :workday
      t.integer :id_system
      t.time :entrytime
      t.time :exittime

      t.timestamps
    end
  end
end
