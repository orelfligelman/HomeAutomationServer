json.array!(@thermometers) do |thermometer|
  json.extract! thermometer, :id, :name, :temperature
  json.url thermometer_url(thermometer, format: :json)
end
