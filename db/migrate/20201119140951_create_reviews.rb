class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
