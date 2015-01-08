json.array!(@thermometers) do |thermometer|
  json.extract! thermometer, :temperature
end
