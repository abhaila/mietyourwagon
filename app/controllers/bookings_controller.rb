class BookingsController < ApplicationController
  before_action :set_user, except: :destroy
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    if @booking.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    user = @booking.user
    @booking.destroy
    redirect_to user_path(user)
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
