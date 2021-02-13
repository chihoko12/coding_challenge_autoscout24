class Contact < ApplicationRecord
  belongs_to :listing
  validates_presence_of :listing_id
  has_one :contact_date
  validates :contact_date, presence: true
end
