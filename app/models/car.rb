class Car < ApplicationRecord
  belongs_to :user
  # price, year, model, brand, description
  # What do we need??
  validates :year, inclusion: { in: 1910..2020, message: "%{value} is not a valid year" }
  validates :year, presence: true
  validates :price, presence: true
  validates :model, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  has_many_attached :photos

  has_many :bookings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
