class UsersController < ApplicationController

  def show
    @cars = Car.where("user_id=?", current_user.id)
  end
end
