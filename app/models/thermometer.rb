class Thermometer < ActiveRecord::Base
	belongs_to :user, :polymorphic => :true
	# validates_associated :user
	# scope :broken (where ('thermometers_updated_at < 300'))
	# self.inheritance_column = :temperature
	before_destroy do
		:email_update_destroy
		self.update_attribute(:deleted_at, Time.current)
		false
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
