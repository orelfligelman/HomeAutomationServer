class Thermometer < ActiveRecord::Base
	def temperature
		Random.rand(100)
	end
end
