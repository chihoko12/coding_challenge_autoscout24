begin
  require_relative "../../app/controllers/listings_controller.rb"
rescue LoadError => e
  if e.message =~ /listings_controller/
    describe "ListingsController" do
      it "You need a 'listings_controller.rb' file for your 'ListingsController'" do
        fail
      end
    end
  else
    raise e
  end
end

RSpec.describe ListingController, type: :controller do
  let(:listings) do
    [
      [ "id", "make", "price", "mileage", "seller_type"],
      [ 1, "Audi", 4300, 20000, "private"],
      [ 2, "Toyota", 18250, 35000, "dealer"],
      [ 3, "VW", 25080, 45678, "private"],
      [ 4, "Porsche", 102000, 2000, "other"],
      [ 5, "BWM", 2538, 50000, "private"],
    ]
  end
  let(:csv_path) { "../../spec/support/listings.csv" }




end
