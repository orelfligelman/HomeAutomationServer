FactoryGirl.define do
	factory :thermometer do
		name "t1"
			max_temp 30
			update_thermo true
			email "orelmfligelman@gmail.com"
	end
end