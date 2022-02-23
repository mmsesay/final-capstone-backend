class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :model_info
      t.decimal :reservation_fee
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
