class AddAverageReviewsToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :average_stars, :integer
  end
end
