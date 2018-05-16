class CreateSystemsessions < ActiveRecord::Migration[5.1]
  def change
    create_table :systemsessions do |t|
      t.integer :id_employee
      t.date :workday
      t.integer :id_system
      t.time :entrytime
      t.time :exittime
    end
  end
end
