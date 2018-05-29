class PaymentsController < ApplicationController
before_action :set_booking
#, :set_space

  def new
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @booking.amount_cents,
    description:  "Payment for #{@booking.space.name} for booking #{@booking.id}",
    currency:     @booking.amount.currency
  )

  @booking.update(status: 'paid')
  redirect_to booking_path(@booking)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_booking_payment_path(@booking)
  end

private


  def set_booking
    @booking = current_user.bookings.where(status: 'Accept & request payment').find(params[:booking_id])
  end

  # def set_space
  #   @space = @space.booking
  # end
end
