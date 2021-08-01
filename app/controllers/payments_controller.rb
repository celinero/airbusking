class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  
  def success
    @order = Order.find_by_event_id(params[:id])
  end

  def create_payment_intent
    event = Event.find(params[:id])
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'], 
        customer_email: current_user&.email, #current_user && current_user.email 
        line_items: [{
          name: event.title, 
          description: event.description, 
          amount: event.price,
          currency: 'aud', 
          quantity: 1
        }], 
        payment_intent_data: {
          metadata: {
            user_id: current_user&.id,
            listing_id: event.id
          }
        }, 
        success_url: "#{root_url}/success?id=#{event.id}", 
        cancel_url: "#{root_url}/events"
      )

      @session_id = session.id 

  end 

  def webhook 
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    pp payment
    event_id = payment.metadata.event_id
    buyer_id = payment.metadata.user_id
    event = Event.find(event_id)
    event.update(sold: true)
    Order.create(event_id: event_id, buyer_id: buyer_id, seller_id: event.user_id, payment_id: payment_id, receipt_url: payment.charges.data[0].receipt_url)
  end 

end
