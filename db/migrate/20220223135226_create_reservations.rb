class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :duration
      t.date :start_date
      t.date :end_date
      t.integer :user_id, null: false
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
