class BookingsController < ApplicationController
   before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
    # 1. Guest creates booking
    # 2. Guest fills in CC details
    # 3.1 Host approves booking > CC charged
    # 3.2 Host declines bookng > CC not charged
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.amount = @booking.set_amount
    @booking.user = current_user
    if @booking.save
      flash[:notice] = "You've booked a space"
      redirect_to space_booking_path(@space, @booking)
    else
      render "spaces/show"
    end
  end

  def edit
  end

  def update
    # Update the booking status. Host can accept or decline.
    @booking.update(booking_params)
    redirect_to user_path(current_user)
  end

  def destroy
    # Cancel the booking, either by guest or host.
    # Refund on payment has to be made if guest cancels within cancellation period OR if host cancels
    @booking.destroy
    redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :guest, :total_price, :user, :space, :status, :booked_activity)
  end
end
