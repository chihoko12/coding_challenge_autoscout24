class Contact < ApplicationRecord
  belongs_to :listing
  validates_presence_of :listing_id
  validates :contact_date, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      contact = new
      contact.attributes = row.to_hash.slice(*updatable_attributes)
      contact.save
    end
  end

  # define column which allows update
  def self.updatable_attributes
    ["listing_id", "contact_date"]
  end
end