json.array!(@thermometers) do |thermometer|
  json.extract! thermometer, :name, :temperature, :updated_at
  json.url thermometer_url(thermometer, format: :json)
end
