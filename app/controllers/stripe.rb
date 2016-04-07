post "/stripe/charge" do
  #  this needs error handeling and rescuing https://stripe.com/docs/api?lang=ruby#errors
  begin
      customer = Stripe::Customer.create(
        :email => params["stripeEmail"],
        :card  => params[:stripeToken]
      )
    rescue Stripe::InvalidRequestError => e
      # do something with the error?
    rescue Stripe::handle_api_error => e
      # do something with the error?
    rescue Stripe::general_api_error => e
      # do something with the error?
    rescue Stripe::StripeError => e
      # do something with the error?
  end
  
  begin
    charge = Stripe::Charge.create(
      :amount      => (params["cost"].to_i),
      :description => 'SleepBus ticket',
      :currency    => 'usd',
      :customer    => customer.id
    )
    rescue Stripe::CardError => e
      # do somthing ?
    rescue Stripe::AuthenticationError => e
      # do somthing ?
    rescue Stripe::StripeError => e
      # do somthing ?
    rescue Stripe::InvalidRequestError => e
      # do somthing ?
  end

  #if !(env['sinatra.error'].message) # if is somewhat uneccessary because the route will have already returned if an error occured due to the rescues, but this works as a last catch all
  ticket_ids = []
  session[:passengers].each do |passenger|
   ticket = Ticket.create({
      passenger_id: passenger.id,
      trip_id: session[:trip_ids][0]
    })
    ticket_ids << ticket.id
    if session[:trip_ids][1]
     ticket = Ticket.create({
        passenger_id: passenger.id,
        trip_id: session[:trip_ids][1]
      })
      ticket_ids << ticket.id
    end
  end
  # should add test here to see if charge went through

  # once javascript start preventDefault() uncomment next three lines
  # confirmPage = erb :payment_success
  # content_type :json
  # return confirmPage.to_json
  erb :payment_success, :locals => {ticket_ids: ticket_ids}
end