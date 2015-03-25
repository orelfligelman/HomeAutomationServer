class ThermometersController < ApplicationController
	include ActionController::Live
  before_action :set_thermometer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
	require 'rake'
	Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
	DeviseDemo::Application.load_tasks # providing your application name is 'sample'

	# def stream
	# 	response.headers['Content-Type'] = 'text/event-stream'
	# 	100.times {
	# 		response.stream.write "hello world\n"
	# 		sleep 1
	# 	}
	# ensure
	# 	response.stream.close
	# end

	# def hello
	# 	puts "hello" *50
	# end

  # def mass_update
  #   # Thermometer.update(params[:thermometers].keys, params[:thermometers].values])
  #   # if thermometer_server.valid?
  #   #   redirect_to temperatures_path
  #   # else
  #   #   render 'edit'
  #   # end
  #   temperature = Thermometer.find(params[:id])
  #   if temperature.update(params[:temperatures])
  #     redirect_to temperatures_path
  #   else
  #     render 'edit'
  #   end
  # end

  # def thermometer_off
  #   temperature = Thermometer.find(params[:id])
  #   if temperature.toggle
  #     redirect_to temperatures_path
  #   end
  # end

  # def email_alert_high_temp
		# # Reading.thermo_respons.parse()
  #   if Reading.thermo_response[0] >  @thermometer.max_rule
		# 	#call mailer method for notifying users
  #   end
  # end

  # def import
  #    Product.import(params[:file])
  #   redirect_to temperatures_path, notice: "Thermometer imported."
  # end
  # GET /thermometers
  # GET /thermometers.json

	# def run
	# 	Rake::Task['thermometer:get_data'].reenable # in case you're going to invoke the same task second time.
	# 	Rake::Task['thermometer:get_data'].invoke
	# end

	# def email?
	# 	every(5.minutes) {}
	# end

  def index
    @thermometer = current_user.thermometers.order('created_at desc')
     if current_user.admin == true
      @user_type = "Admin"
      current_user.add_role "admin"
    else
      @user_type = "Non-Admin"
    end
  end

	def monitor
		puts "hello"
		# if @reading > @thermometer.max_temp
		# 	ThermometerMailer.max_thermo_violation
		# end
	end

  # GET /thermometers/1
  # GET /thermometers/1.json
  def show
		@thermometer = Thermometer.find(params[:id])
		respond_to do |format|
			format.html
			format.json
		end
  end

  # GET /thermometers/new
  def new
    # authorize! :edit, @thermometer
    @thermometer = Thermometer.new
		# 1.times @thermometer.reading.build
  end

  # GET /thermometers/1/edit
  def edit
     @thermometer = Thermometer.find(params[:id])
    authorize! :edit, @thermometer
  end

  # POST /thermometers
  # POST /thermometers.json
  def create
		puts "*"*50
		puts params
    @thermometer = current_user.thermometers.new(thermometer_params)

    respond_to do |format|
      if @thermometer.save
				# @thermometer.hello
				ThermometerMailer.thermo_confirmation(@thermometer).deliver
				# @thermometer.thermo_max_violation
        format.html { redirect_to @thermometer, notice: 'Thermometer was successfully created.' }
        format.json { render :show, status: :created, location: @thermometer }
				format.js
      else
        format.html { render :new }
        format.json { render json: @thermometer.errors, status: :unprocessable_entity }
			end
		endlfjhaefj
  end

  # PATCH/PUT /thermometers/1
  # PATCH/PUT /thermometers/1.json
  def update
    respond_to do |format|
      if @thermometer.update(thermometer_params)
        format.html { redirect_to @thermometer, notice: 'Thermometer was successfully updated.' }
        format.json { render :show, status: :ok, location: @thermometer }
      else
        format.html { render :edit }
        format.json { render json: @thermometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thermometers/1
  # DELETE /thermometers/1.json
  def destroy
    @thermometer.destroy
		puts "*" *50
		puts @thermometer
     # UserMailer.email_update_destroy(@users).deliver
    respond_to do |format|
      format.html { redirect_to thermometers_url, notice: 'Thermometer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thermometer
      @thermometer = Thermometer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thermometer_params
      params.require(:thermometer).permit(:name, :temperature, :email, :max_temp, :update_thermo, :reading_id)
    end
end

