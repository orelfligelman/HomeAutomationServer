namespace :reading do
	desc "check every five minutes to make sure thermometer server is sending data"
	rask :check_data => :environment do
		#check JSON
	end
end