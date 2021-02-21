require 'rails_helper'

begin
  require_relative '../../app/models/contact.rb'
rescue  LoadError => e
  if e.message =~ /contact/
    describe "Contact" do
      it "You need a 'contact.rb' file for your 'Contact' model" do
        fail
      end
    end
  else
    raise e
  end
end

RSpec.describe Contact, type: :model do
    describe "Contact", :contact do
    it "should be initialized" do
      properties = { listing_id: 1095, contact_date: 1586674958000 }
      contact = Contact.new(properties)
      expect(contact).to be_a(Contact)
    end

    describe "#listing_id" do
      it "should return the listing id" do
        contact = Contact.new({ listing_id: 1035 })
        expect(contact.listing_id).to eq(1035)
      end
    end

    describe "#contact_date" do
      it "should return the contact date" do
        contact = Contact.new({ contact_date: 1583574198000 })
        expect(contact.contact_date).to eq(1583574198000)
      end
    end
  end
end
