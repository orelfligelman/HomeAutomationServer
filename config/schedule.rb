every 45.seconds do
	runner "Reading.get_reading"
end

every 45.seconds do
	runner "Reading.check_max_violation?"
end

every 5.minutes do
	runner "Reading.thermo_reading?"
end