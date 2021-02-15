class ContactsController < ApplicationController
before_action :load_csv, only: [:contacts]

  def index
    @contacts = Contact.all
  end

  def import
    Contact.import(params[:file])
    redirect_to listings_url
  end
end
