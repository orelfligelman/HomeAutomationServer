class Users::UserviewController < Devise::UserviewController
	# before_filter :authenticate_user!
	# store :preferences, accessors: [:inline_help]


	def index
    @users = User.all
    # render partial: 'thermometers/form'
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @thermometers = Thermometers.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserWorkers.perform_async(@user_id)
        format.html { sign_in_and_redirect @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:notice] = "Please try again"
				redirect_to new_user_registration_url
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:users).permit(:name, :email)
    end
end

