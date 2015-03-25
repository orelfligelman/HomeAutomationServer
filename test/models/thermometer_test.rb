require 'test_helper'

class ThermometerTest < ActiveSupport::TestCase
  test "should not save thermometer without a name" do
		thermometer = Thermometer.new
		assert_not thermometer.save
	end

	test "thermometer begins to get readings when it is created" do
		thermometer = Thermometer.new
		assert_not_nil uri, "thermometer does not get readings after being created"
	end
	test "thermometer gets a number (useful for ensuring JSON API isnt breaking)" do
		thermometer = Thermometer.new
		assert_instance_of Fixnum, thermometer.get_reading, "thermometer did not produce a reading"
	end

	test "thermometer reading is not empty" do
		thermometer = Thermometer.new
		thermometer.get_reading
		assert_not_empty thermometer.temperature , "thermometer did not produce a reading"
	end



# test "should email user when new thermometer is created" do
#
# end

# test "should be viewable by only a specific user" do
#
# end
#
# 	test "should email a user if a thermometer goes over maximum temperature set by user" do
#   assert true
# end
end


