class ThermometersController < ApplicationController
  # before_action :set_thermometer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!


  def mass_update
    # Thermometer.update(params[:thermometers].keys, params[:thermometers].values])
    # if thermometer.valid?
    #   redirect_to temperatures_path
    # else
    #   render 'edit'
    # end
    temperature = Thermometer.find(params[:id])
    if temperature.update(params[:temperatures])
      redirect_to temperatures_path
    else
      render 'edit'
    end
  end

  def thermometer_off
    temperature = Thermometer.find(params[:id])
    if temperature.toggle
      redirect_to temperatures_path
    end
  end

  def email_alert
    t = Thermometer.all
    if t.where(params[:temperature] > params[:temperature_max])
      #send mail to @user
    end
  end

  def import
     Product.import(params[:file])
    redirect_to temperatures_path, notice: "Thermometer imported."
  end
  # GET /thermometers
  # GET /thermometers.json
  def index
    @thermometer = current_user.thermometers.order('created_at desc')
     if current_user.admin == true
      @user_type = "Admin"
      current_user.add_role "admin"
    else
      @user_type = "Non-Admin"
    end
  end

  # GET /thermometers/1
  # GET /thermometers/1.json
  def show
  end

  # GET /thermometers/new
  def new
    authorize! :edit, @thermometer
    @thermometer = Thermometer.new
  end

  # GET /thermometers/1/edit
  def edit
     @thermometer = Contact.find(params[:id])
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
				@thermometer.mail_deliver
        format.html { redirect_to @thermometer, notice: 'Thermometer was successfully created.' }
        format.json { render :show, status: :created, location: @thermometer }
      else
        format.html { render :new }
        format.json { render json: @thermometer.errors, status: :unprocessable_entity }
      end
    end
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
     UserMailer.email_update_destroy(@user).deliver
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
      params.require(:thermometer).permit(:name, :temperature)
    end
end

