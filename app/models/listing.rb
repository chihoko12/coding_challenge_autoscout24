class Listing < ApplicationRecord
  validates :id, presence: true
  validates :make, presence: true
  validates :price, presence: true
  validates :mileage, presence: true
  validates :seller_type, presence: true

end
