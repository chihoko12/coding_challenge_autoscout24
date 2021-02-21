require 'rails_helper'

begin
  require_relative '../../app/models/listing.rb'
rescue  LoadError => e
  if e.message =~ /listing/
    describe "Listing" do
      it "You need a 'listing.rb' file for your 'Listing' model" do
        fail
      end
    end
  else
    raise e
  end
end

RSpec.describe Listing, type: :mode do

  describe "Listing", :listing do
    it "should be initialized" do
      properties = { id: 1005, make: "Audi", price: 43667, mileage: 500, seller_type: "private"}
      listing = Listing.new(properties)
      expect(listing).to be_a(Listing)
    end

    describe "#id" do
      it "should return the id of the listing" do
        listing = Listing.new({ id: 1010 })
        expect(listing.id).to eq(1010)
      end
    end

    describe "#make" do
      it "should return the make of the listing" do
        listing = Listing.new({ make: "VW"})
        expect(listing.make).to eq("VW")
      end
    end

    describe "#price" do
      it "should return the price of the listing" do
        listing = Listing.new({ price: 15000})
        expect(listing.price).to eq(15000)
      end
    end

    describe "#mileage" do
      it "should return the mileage of the listing" do
        listing = Listing.new({ mileage: 20000})
        expect(listing.mileage).to eq(20000)
      end
    end

    describe "seller_type" do
      it "should return the seller type of the listing" do
        listing = Listing.new({ seller_type: "private"})
          expect(listing.seller_type).to eq("private")
      end
    end
  end
end
