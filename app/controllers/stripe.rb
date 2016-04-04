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
      :amount      => (params["cost"].to_i * 100),
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

  if charge.save && customer.save # <- not real syntax, .save isn't a thing I don't think
    session[:passengers].each do |passenger|
      Ticket.create({
        passenger_id: passenger.id,
        trip_id: session[:trip_ids][0]
      })
      Ticket.create({
        passenger_id: passenger.id,
        trip_id: session[:trip_ids][1]
      })
    end
  end
  # should add test here to see if charge went through

  # once javascript start preventDefault() uncomment next three lines
  # confirmPage = erb :payment_success
  # content_type :json
  # return confirmPage.to_json
  erb :payment_success, :layout => false
end