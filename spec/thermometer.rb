

Rspec.describe User, :type => :model do
	it "creates a user" do
		user = User.new

		expect (User.name).to eq nil
	end
end



Rspec.describe User, :type => :model do
	context "creating a new user"
	it "creates a user" do
		user = User.new

		expect (User.name).to eq nil
	end
end
