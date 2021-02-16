class Contact < ApplicationRecord
  belongs_to :listing
  validates_presence_of :listing_id
  validates :contact_date, presence: true

  def self.import(file)
    columns = %i(listing_id, contact_date)
    CSV.foreach(file.path).each_slice(1000) do |row|
      values = []
      values << [row[0], row[1]]
      # contact.attributes = row.to_hash.slice(*updatable_attributes)
      # contact.save
      Contact.import columns, values
    end
  end

  # define column which allows update
  # def self.updatable_attributes
  #   ["listing_id", "contact_date"]
  # end
end
