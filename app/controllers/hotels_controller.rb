require 'hotel_decorator'


class HotelsController < ApplicationController

  before_action :set_hotel, only: %i[show edit update] #only shows hotels before having to authenticate
  before_action :user_signed_in?, only: [:edit, :create, :update]
   #once user is logged in they can do these things, not any ordinary joe can do these things
  #before_action :authenticate_user!
  before_action :check_admin, only: [:destroy] #only admin can do this!


  # GET /hotels or /hotels.json
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1 or /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
    @hotel = Hotel.find(params[:id])
  end

  # POST /hotels or /hotels.json
  def create
   # @hotel = Hotel.new(hotel_params)

   private

   def check_admin
    puts 'check_admin method called'  # Debugging statement
    unless admin?
      redirect_to root_url, alert: "You are not authorized to perform this action."
    end
  end


   #implementing decorator design
    @hotel = Hotel.new()
    #@hotel.size = params[:hotel][:size]
    #@hotel.amenities = params[:hotel][:amenities]
    @hotel.name_room = params[:hotel][:name_room]
    @hotel.price = params[:hotel][:price]
    @hotel.full_name = params[:hotel][:full_name]
    @hotel.email = params[:hotel][:email]

     # Create a BasicHotel with the required params
     #basic_hotel = BasicHotel.new(@hotel.name, @hotel.price)

     # Use that to decorate the hotel
     #decorated_hotel = DecoratedHotel.new(basic_hotel)
 
     # Get the decorated special feature and save it to a description or another attribute
     #@hotel.description = @hotel.description + " " + decorated_hotel.special_feature
 
     def admin?
      current_user && current_user.admin?
    end
  

  def about
      # about page
  end

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel was successfully created." }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1 or /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel was successfully updated." }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    #stops and inspects for bugs
    byebug
    @hotel.destroy!

    respond_to do |format|
      format.html { redirect_to hotels_url, notice: "Hotel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name_room, :price, :full_name, :email)
    end
end
