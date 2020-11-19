class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @car = Car.find(params[:car_id])
    @review.car = @car

    if @review.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:stars)
  end
end
