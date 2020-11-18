class UsersController < ApplicationController

  # def index_bookings
  #   @your_bookings = Booking.where("user_id=?", current_user.id)
  #   @your_cars_bookings = Booking.where("car_id=?", current_user.cars)
  # end

  def show
    @user = current_user
    @cars = @user.cars

    @your_bookings = @user.bookings

    @incoming_bookings = @user.incoming_bookings
    # @your_cars_bookings = Booking.where(cars: @cars)
  end
end
