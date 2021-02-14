class Listing < ApplicationRecord
  validates :id, presence: true
  validates :make, presence: true
  validates :price, presence: true
  validates :mileage, presence: true
  validates :seller_type, presence: true

  def self.headers
    %w[id make price mileage seller_type]
  end

  def to_csv_row
    [@id, @make, @price, @mileage, @seller_type]
  end
end
