def violate
	ThermometerMailer.thermo_max_violation(@thermometer).deliver
end
