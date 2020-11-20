class UsersController < ApplicationController

  def show
    @user = current_user
    @cars = @user.cars

    @your_bookings = @user.bookings

    @past_bookings = @your_bookings.where("end_date < ?", Date.today)
    @upcoming_bookings = @your_bookings.where("start_date >= ?", Date.today)

    @incoming_bookings = @user.incoming_bookings
    # @your_cars_bookings = Booking.where(cars: @cars)
  end
end
