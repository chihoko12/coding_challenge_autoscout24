class ListingsController < ApplicationController

  def index
    @listings = Listing.all
    @contacts = Contact.all
  end

  def import
    Listing.import(params[:file])
    redirect_to listings_url
  end

  def price_per_seller_type
    @privates = Listing.where(seller_type: "private")
    @dealers = Listing.where(seller_type: "dealer")
    @others = Listing.where(seller_type: "other")

    @privates_price = @privates.sum(:price) / @privates.count
    @dealers_price = @dealers.sum(:price) / @dealers.count
    @others_price = @others.sum(:price) / @others.count
  end

  def cars_by_make
    @makes = Listing.group(:make).count.sort_by { |k,v| -v}
    @listings_count = Listing.all.count
  end

  def price_most_contacted
    # @contacts_count = Contact.all.count
    @contacts = Contact.group(:listing_id).count.sort_by { |k,v| -v}

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
  end

end
