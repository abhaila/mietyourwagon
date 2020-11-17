class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])

  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated'
    else
      render :edit
    end
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :year, :description, :price)
  end

end
