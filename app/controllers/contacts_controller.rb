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
    @list = {}

    Contact.all.order(:contact_date).each do |cnt|
      month = Time.at(cnt[:contact_date]/1000).strftime("%m.%Y")
        if @list[month]
          @list[month] << cnt[:listing_id]
        else
          @list[month] = [cnt[:listing_id]]
        end
    end

    @top_five = {}
    @list.each do |k,v|
      value  = v.uniq.map{ |t| [t,v.count(t)]}.to_h.sort_by { |_, v| -v }.first(5).to_h
      @top_five[k] = value
    end
  end
end
