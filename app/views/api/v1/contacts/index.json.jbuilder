json.array! @contacts do |contact|
  json.extract! contact, :listing_id, :contact_date
end
