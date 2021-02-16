class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def import
    Contact.delete_all unless Contact.empty?
    Contact.import(params[:file])
    redirect_to listings_url
  end

  def count
    @contacts = Contact.group(:listing_id).order('count_listing_id DESC').count(:listing_id)
  end

  def price_most_contacted
    @contacts = Contact.group(:listing_id).order('count_listing_id DESC').count(:listing_id)

    @price_sum = 0
    @contact_count = 0
    @listing_count = 0

     @contact_count < Contact.all.count * 0.3
        @contacts.each do |contact|
          # puts @price_sum += Listing.find(contact[0]).price
          puts @contact_count += contact[1]
          # puts @listing_count += + 1
        end
    # end
  end

  def price_top_five_contacted
    @contacts = render contacts: 'count'
  end

end
