class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def import
    Contact.import(params[:file])
    redirect_to listings_url
  end

  def count
    @contacts = Contact.group(:listing_id).order('count_listing_id DESC').count(:listing_id)
  end

  def price_most_contacted
    @contacts = Contact.group(:listing_id).order('count_listing_id DESC').count(:listing_id)

    @price_sum = 0
    @contact_count = Contact.all.count * 0.3
    @listing_count = 0


    # loop do
    #  break if @contact_count.zero?
    #     @contacts.each do |contact|
    #       @price_sum += Listing.find(contact[0]).price
    #       @contact_count -= contact[1]
    #       @listing_count += 1
    #     end
    # end
  end

  def price_top_five_contacted
    @contacts = render contacts: 'count'
  end

end
