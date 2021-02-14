class Contact < ApplicationRecord
  belongs_to :listing
  validates_presence_of :listing_id
  has_one :contact_date
  validates :contact_date, presence: true

  def self.headers
    %w[listing_id contact_date]
  end

  def to_csv_row
    [@listings_id, @contact_date]
  end
end
