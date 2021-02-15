class Contact < ApplicationRecord
  belongs_to :listing
  validates_presence_of :listing_id
  validates :contact_date, presence: true
end
