class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    # Guest can create a new review when event date has passed.
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @space = @booking.space
    @review.save
    if @review.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
  end

  def update
    # Guest can edit a review
    # Host cannot edit a review
    @review.update(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
