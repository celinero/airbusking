class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  
  def success
    @title = params[:title]
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
        success_url: "#{root_url}/success?title=#{event.title}", 
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
    event = Event.find(listing_id)
    event.update(sold: true)
    
  end 

end
