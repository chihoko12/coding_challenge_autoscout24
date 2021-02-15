class ContactsController < ApplicationController
require "csv"
before_action :load_csv, only: [:contacts]

def sort
  @contacted = @contacts.reject{ |c| c[0] == "listing_id"}.map { |c| c[0]}
  @counts = @contacted.inject(Hash.new(0)) { |total, e| total[e] += 1; total }
  @sorted = @counts.sort_by { |k,v| -v }
end

private

  def load_csv
    @contacts = []
    @csv_file = "data/contacts.csv"
    if File.exist?(@csv_file)
      CSV.foreach(@csv_file) do |row|
        @contacts << row
      end
    end
  end
end


