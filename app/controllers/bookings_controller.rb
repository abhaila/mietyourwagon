class BookingsController < ApplicationController
  before_action :set_car, except: [:destroy, :show, :edit, :update]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @car = set_car
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @car = @booking.car
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to user_path(current_user)
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
