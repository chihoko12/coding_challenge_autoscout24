class ContactsController < ApplicationController
before_action :load_csv, only: [:contacts]

  def index
    @contacts = Contact.all
  end

  def import
    Contact.import(params[:file])
    redirect_to listings_url
  end


  def sort
    @contacted = @contacts.reject{ |c| c[0] == "listing_id"}.map { |c| c[0]}
    @counts = @contacted.inject(Hash.new(0)) { |total, e| total[e] += 1; total }
    @sorted = @counts.sort_by { |k,v| -v }
  end
end
