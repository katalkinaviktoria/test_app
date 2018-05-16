class CreateCheckpoints < ActiveRecord::Migration[5.1]
  def change
    create_table :checkpoints do |t|
      t.integer :id_employee
      t.date :workday
      t.time :entrytime
      t.time :exittime
    end
  end
end
