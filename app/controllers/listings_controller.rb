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
    @makes = @listings.reject{ |m| m[1] == "make"}.map { |m| m[1]}
    @counts = @makes.inject(Hash.new(0)) { |total, e| total[e] += 1; total }
    @sorted = @counts.sort_by { |k,v| -v }
  end

  def price_most_contacted
    render 'contacts/sort'
  end

  def price_top_five_contacted
  end

end
