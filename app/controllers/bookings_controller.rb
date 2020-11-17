class BookingsController < ApplicationController
  before_action :set_car, except: [:destroy, :show]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    car = @booking.car
    @booking.destroy
    redirect_to car_path(car)
  end

  private
  def set_car
    @car = Car.find(params[:car_id])
  end



  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

# Need to assign booking . user to current user for it to save
