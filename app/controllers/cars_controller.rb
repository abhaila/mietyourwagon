class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :calculate_average_stars, only: :show

  def index
    @cars = Car.all
    if params[:query].present?
      @cars = Car.search_by_brand(params[:query])
    else
      @cars = Car.all
    end

      # adding geocoding code below
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: 'info_window', locals: { car: car }),
        image_url: helpers.asset_url('miet_logo.png')
      }
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
    @review = Review.new

    respond_to do |format|
      format.html
      format.json { render json: { car: @car } }
    end
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

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, notice: 'Car was successfully deleted'
  end

  private

  def calculate_average_stars
    @car = Car.find(params[:id])
    sum = 0
    @car.reviews.each do |review|
      sum += review.stars
    end
    if @car.reviews.count >= 1
      @car.average_stars = sum / @car.reviews.count
    else
      @car.average_stars = nil
    end
    @car.save
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :description, :address, :price, photos: [])
  end

end
