	require 'spec_helper'
	#
	# Rspec.describe User, :type => :model do
	# 	it "creates a user" do
	# 		user = User.new
	# 		expect (User.name).to eq nil
	# 	end
	# end

	describe Reading do
		before :each do
			@reading = Reading.new(100)
		end
	describe "#new" do
		it "returns a reading object" do
			expect(@reading).to be_an_instance_of(Reading)
		end
	end
end
