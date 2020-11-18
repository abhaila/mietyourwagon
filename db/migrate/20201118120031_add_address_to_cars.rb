class AddAddressToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :address, :text
    add_column :cars, :longitude, :float
    add_column :cars, :latitude, :float
  end
end
