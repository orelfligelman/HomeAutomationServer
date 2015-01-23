class Reading < ActiveRecord::Base
	# validates :foreign_key, :uniqueness => true
	attr_accessor :temperature
	belongs_to :thermometer

	def get_reading
		uri = URI.parse('http://localhost:5000/thermometers.json')
		thermo_response = Net::HTTP.get_response(uri)
		check = thermo_response.body
		j = JSON.parse(check)
		self.temperature = j[0]["temperature"]
		self.save
		# respond_to do |format|
		# 	format.html
		# 	format.json
		# end
	end

	def max_violation?
		@thermometer=Thermometer.last
		if self.temperature > @thermometer.max_temp
			puts "yes!!!" * 100
			ThermometerMailer.thermo_max_violation(@thermometer).deliver
		end
	end

	# def thermo_updated?
	# 	if @reading.updated_at > 5.minutes.ago
	# 		ThermometerMailer.thermo_not_updated(@thermometer).deliver
	# 	end
	end
	# def get_reading
	# uri = URI.parse('http://localhost:5000/thermometers.json')
	# thermo_reading = Net::HTTP.get_response(uri)
	# current_temp = thermo_reading.body
	# @parsed_temp = JSON.parse(current_temp)
	# end
	#
	# def max_violation
	# 	if @parsed_temp[0]["temperature"] > @thermometer.max_temp
	# 		ThermometerMailer.delay.thermo_max_violation
	# end
