object @thermometer
puts @thermometer
puts "*" *50
attributes :id, :name, :temperature, :published_at

if current_user.admin?
  node(:edit_url) { |thermometer| edit_thermometer_url(thermometer) }
end

