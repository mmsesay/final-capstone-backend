class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :image
      t.text :description
      t.string :model_info
      t.integer :reservation_fee
      t.integer :user_id

      t.timestamps
    end

    add_index :cars, :user_id
  end
end
