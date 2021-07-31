class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  
  def success
    @event = event.find_by_event_id(params[:id])
  end

  def webhook 
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    pp payment
    event_id = payment.metadata.event_id
    buyer_id = payment.metadata.user_id
    event = Event.find(listing_id)
    event.update(sold: true)
    
  end 

end
