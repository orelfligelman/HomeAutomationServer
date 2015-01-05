object @thermometer
attributes :id, :name, :temperature, :published_at

if current_user.admin?
  node(:edit_url) { |thermometer| edit_thermometer_url(thermometer) }
end

child :author do
  attributes :id, :name
  node(:url) { |author| author_url(author) }
end

child :comments do
  attributes :id, :name, :content
end