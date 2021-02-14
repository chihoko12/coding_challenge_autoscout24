class ListingsController < ApplicationController
require "csv"
before_action :load_csv, only: [:index, :price_per_seller_type]

  def index
  end

  def price_per_seller_type
    @privates =[]
    @dealers = []
    @others = []

    @listings.each do |lst|
      case lst[4]
        when "private"
          @privates << lst[2].to_i
        when "dealer"
          @dealers << lst[2].to_i
        when "other"
          @others << lst[2].to_i
        end
    end

    @privates_price = @privates.sum / @privates.count
    @dealers_price = @dealers.sum / @dealers.count
    @others_price = @others.sum / @others.count
  end

  def cars_by_make
  end

  def price_most_contacted
  end

  def price_top_five_contacted
  end

  private

  def load_csv
    @listings = []
    @csv_file = "data/listings.csv"
    CSV.foreach(@csv_file) do |row|
      @listings << row
    end
  end


  # def load_csv
  #   @csv_file = "data/listings.csv"

  #   if File.exists?(@csv_file)
  #     csv_options = { headers: :first_row, header_converters: :symbol }
  #     CSV.foreach(@csv_file, csv_options) do |row|
  #       @listings << build_instance(row)
  #     end
  #     @next_id = @listings.last.id + 1 unless @listings.empty?
  #   end
  # end

  # def save_csv
  #   CSV.open(@csv_file, "wb") do |csv|
  #     csv << @listings.first.class.headers
  #     @listings.each do |lst|
  #       csv << lst.to_csv_row
  #     end
  #   end
  # end

  # def build_instance(row)
  #   row[:id] = row[:id].to_i
  #   row[:make] = row[:make]
  #   row[:price] = row[:price].to_i
  #   row[:mileage] = row[:mileage].to_i
  #   row[:seller_type] = row[:seller_type]
  #   Listing.new(row)
  # end
end
