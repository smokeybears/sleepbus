post "/stripe/charge" do
  #  this needs error handeling and rescuing https://stripe.com/docs/api?lang=ruby#errors
  begin
      customer = Stripe::Customer.create(
        :email => params["stripeEmail"],
        :card  => params[:stripeToken]
      )
    rescue Stripe::InvalidRequestError => e
      return e
    rescue Stripe::handle_api_error => e
      return e
    rescue Stripe::general_api_error => e
      return e
    rescue Stripe::StripeError => e
      return e
  end

  begin
    charge = Stripe::Charge.create(
      :amount      => (params["cost"].to_i * 100),
      :description => 'SleepBus ticket',
      :currency    => 'usd',
      :customer    => customer.id
    )
    rescue Stripe::CardError => e
      return e
    rescue Stripe::AuthenticationError => e
      return e
    rescue Stripe::StripeError => e
      return e
    rescue Stripe::InvalidRequestError => e
      return e
  end

  #if !(env['sinatra.error'].message) # if is somewhat uneccessary because the route will have already returned if an error occured due to the rescues, but this works as a last catch all
  session[:passengers].each do |passenger|
    Ticket.create({
      passenger_id: passenger.id,
      trip_id: session[:trip_ids][0]
    })
    Ticket.create({
      passenger_id: passenger.id,
      trip_id: session[:trip_ids][1]
    })
   # end
  end
  # should add test here to see if charge went through

  # once javascript start preventDefault() uncomment next three lines
  # confirmPage = erb :payment_success
  # content_type :json
  # return confirmPage.to_json
  erb :payment_success, :layout => false
end