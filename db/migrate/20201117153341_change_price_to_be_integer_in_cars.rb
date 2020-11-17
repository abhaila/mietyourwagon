class ChangePriceToBeIntegerInCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :price
    add_column :cars, :price, :decimal, precision: 8, scale: 2
  end
end
