class Review < ApplicationRecord
  belongs_to :car

  validates :stars, inclusion: { in: 1..5, message: "Please enter a number between 1 and 5" }
end
