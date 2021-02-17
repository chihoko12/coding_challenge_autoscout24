json.array! @listings do |listing|
  json.extract! listing, :id, :make, :price, :mileage, :seller_type
end
