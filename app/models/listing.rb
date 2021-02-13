class Listing < ApplicationRecord
  has_one :make, :price, :mileage, :seller_type
  validates :make, presence: true
  validates :price, presence: true
  validates :mileage, presence: true
  validates :seller_type, presence: true
end
