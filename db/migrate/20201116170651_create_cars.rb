class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :price
      t.integer :year
      t.string :model
      t.string :brand
      t.text :description

      t.timestamps
    end
  end
end
