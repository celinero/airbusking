class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorise_user, only: [:edit, :update, :destroy]
  before_action :busker_only, only: [:new]
  before_action :set_genres, only: [:new, :edit, :update]

  # GET /events or /events.json
  def index
    @events = Event.search(params[:query], params[:option]).all.includes(:genre)
    @busker_profile = current_user&.busker_profile
  end

  # GET /events/1 or /events/1.json
  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'], 
      customer_email: current_user&.email,
      line_items: [{
        name: @event.title, 
        description: @event.description, 
        amount: @event.price,
        currency: 'aud' ,
        quantity: 100
      }], 
      payment_intent_data: {
        metadata: {
          user_id: current_user&.id,
          listing_id: @event.id
        }
      }, 
      success_url: "#{root_url}/success?title=#{@event.title}", 
      cancel_url: "#{root_url}/events"
    )

    @session_id = session.id 
    @busker_profile = BuskerProfile.all.find_by_user_id(@event.user_id)
  end
  

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def authorise_user
      if current_user.id != @event.user_id
        flash[:error] = "you're not allowed to do that"
        redirect_to events_path
      end
    end

    def busker_only
      if !current_user.busker_profile
        flash[:error] = "You're not allowed to do that, first create a busker profile"
        redirect_to events_path
      end
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:user_id, :genre_id, :title, :description, :date, :time, :price, :quantity, :picture)
    end

    def set_genres
      @genres = Genre.all
    end

end
