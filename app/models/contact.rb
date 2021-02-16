class Contact < ApplicationRecord
  belongs_to :listing
  validates_presence_of :listing_id
  validates :contact_date, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      contact = new
      contact.attributes = row.to_h.slice(*updatable_attributes)
      contact.save
    end
  end

  def self.updatable_attributes
    ["listing_id", "contact_date"]
  end
end
