class Listing < ApplicationRecord
  validates :id, :make, :price, :mileage, :seller_type, presence: true
  has_many :contacts

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # if ID exists, call record, if not, create new
      listing = find_by(id: row["id"]) || new
      # get data from CSV and set
      listing.attributes = row.to_hash.slice(*updatable_attributes)
      listing.save
    end
  end

  # define column which allows update
  def self.updatable_attributes
    ["id", "make", "price", "mileage", "seller_type"]
  end

end
