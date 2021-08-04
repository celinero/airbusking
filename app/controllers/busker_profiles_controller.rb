class BuskerProfilesController < ApplicationController
  before_action :set_busker_profile, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /busker_profiles or /busker_profiles.json
  def index
    @busker_profiles = BuskerProfile.all
  end

  # GET /busker_profiles/1 or /busker_profiles/1.json
  def show
  end

  # GET /busker_profiles/new
  def new
    @busker_profile = BuskerProfile.new
  end

  # GET /busker_profiles/1/edit
  def edit
  end

  # POST /busker_profiles or /busker_profiles.json
  def create
    @busker_profile = current_user.busker_profiles.new(busker_profile_params)

    respond_to do |format|
      if @busker_profile.save
        format.html { redirect_to @busker_profile, notice: "Busker profile was successfully created." }
        format.json { render :show, status: :created, location: @busker_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @busker_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busker_profiles/1 or /busker_profiles/1.json
  def update
    respond_to do |format|
      if @busker_profile.update(busker_profile_params)
        format.html { redirect_to @busker_profile, notice: "Busker profile was successfully updated." }
        format.json { render :show, status: :ok, location: @busker_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @busker_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busker_profiles/1 or /busker_profiles/1.json
  def destroy
    @busker_profile.destroy
    respond_to do |format|
      format.html { redirect_to busker_profiles_url, notice: "Busker profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busker_profile
      @busker_profile = BuskerProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def busker_profile_params
      params.require(:busker_profile).permit(:user_id, :name, :bio)
    end
end
