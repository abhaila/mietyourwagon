class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # price, year, model, brand, description
  # What do we need??
  validates :year, inclusion: { in: 1910..2020, message: "%{value} is not a valid year" }
  validates :year, presence: true
  validates :price, presence: true
  validates :model, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  has_many_attached :photos
end
