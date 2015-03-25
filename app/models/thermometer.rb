class Thermometer < ActiveRecord::Base
	belongs_to :user
	has_many :readings
	after_create :get_reading
	# validates_associated :users
	# scope :broken (where ('thermometers_updated_at < 300'))
	# self.inheritance_column = :temperature


	def get_reading
		uri = URI.parse('http://localhost:5000/thermometers.json')
		thermo_response = Net::HTTP.get_response(uri)
		check = thermo_response.body
		j = JSON.parse(check)
	end

	def mail_deliver
		# @thermometer_server = Thermometer.find(params[:id])
		ThermometerMailer.delay.thermo_confirmation(self)
	end

	def max_violation?
		@thermometer=Thermometer.last
		if self.temperature > @thermometer.max_temp
			puts "yes!!!" * 100
			ThermometerMailer.thermo_max_violation(@thermometer).deliver
		end
	end


	def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    product = find_by_id(row["id"]) || new
    product.attributes = row.to_hash.slice(*accessible_attributes)
    product.save!
  		end
	end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Csv.new(file.path, nil, :ignore)
  when ".xls" then Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
end
