class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def import
    Contact.delete_all unless Contact.count.zero?
    Contact.import(params[:file])
    redirect_to root_path
  end

  def price_most_contacted
    @contacts = @contacts = Contact.group(:listing_id).order('count_listing_id DESC').count(:listing_id)
    @price_sum = 0
    @counter = 0
    @contact_sum = 0

      @contacts.each do |contact|
        @counter += + 1
        @price_sum += Listing.find(contact[0]).price
        @contact_sum += contact[1]
        if @contact_sum >= Contact.all.count * 0.3
          @counter -= 1
          @price_sum -= Listing.find(contact[0]).price
          @contact_sum -= contact[1]
          break
        end
      end
  end

  def price_top_five_contacted
    @monthly = monthly_result



  end

  def monthly_result
    @contact_month = {}
    @counts = {}

    Contact.all.order(:contact_date).each do |cnt|
      month = Time.at(cnt[:contact_date]/1000).strftime("%m.%Y")
      if @contact_month.has_key?(month)
        if @counts[cnt.listing_id.to_s]
          @counts[cnt.listing_id.to_s] += 1
        else
          @counts[cnt.listing_id.to_s] = 1
        end
        @contact_month[month] < @counts
      else
        @counts[cnt.listing_id.to_s] = 1
        @contact_month[month] = @counts
      end
    end
  end

end

