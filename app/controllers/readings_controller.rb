class ReadingsController < ApplicationController
	include ActionController::Live
	before_filter :authenticate_user!


	def index
		# @thermometer=Thermometer.find(params[:thermometer_id])
		@reading = Reading.all
		if current_user.admin == true
			@user_type = "Admin"
			current_user.add_role "admin"
		else
			@user_type = "Non-Admin"
		end
	end

	def new
		authorize! :edit, @reading
		@reading = Reading.new
	end



	def show
		@reading = Reading.new
		@reading.get_reading
		@reading.max_violation?
		@reading.thermo_updated?
		puts "hello" *100
		puts params
		puts @reading
		puts @reading.inspect

		respond_to do |format|
			format.html
			format.json
		end
	end



	private
	# Use callbacks to share common setup or constraints between actions.
	def set_reading
		@reading = Reading.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def reading_params
		params.require(:reading).permit(:temperature, :id, :thermometer_id)
	end

end

