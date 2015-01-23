# require 'Thermometer.rb'
namespace :thermometer do
		desc "Call app and get json data"
		#task method takes a hash parameter. get_data is the key
		#environment means rails application will load
		task :get_data => :environment do
		uri = URI.parse('http://localhost:5000/thermometers.json')
		thermo_response = Net::HTTP.get_response(uri)
		check = thermo_response.body
		j = JSON.parse(check)
			return j
	end
end