json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :mobile_no, :department
  json.url contact_url(contact, format: :json)
end
