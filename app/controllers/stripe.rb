post "/stripe/charge" do
  #  this needs error handeling and rescuing https://stripe.com/docs/api?lang=ruby#errors
  # session['trip_ids'].each do |id|
    # make sure each trip still has enough seats
  #   if Trip.find(id.to_i).seats_left - session[:passengers].length < 0
  #     return e
  #   end
  # end
  begin
      customer = Stripe::Customer.create(
        :email => params["stripeEmail"],
        :card  => params[:stripeToken]
      )
    rescue Stripe::InvalidRequestError => e
      # return e
    rescue Stripe::handle_api_error => e
      # return e
    rescue Stripe::general_api_error => e
      # return e
    rescue Stripe::StripeError => e
      # return e
  end

  begin
    charge = Stripe::Charge.create(
      :amount      => (params["cost"].to_i),
      :description => 'SleepBus ticket',
      :currency    => 'usd',
      :customer    => customer.id
    )
    rescue Stripe::CardError => e
      # return e
    rescue Stripe::AuthenticationError => e
      # return e
    rescue Stripe::StripeError => e
      # return e
    rescue Stripe::InvalidRequestError => e
      # return e
  end


  #if !(env['sinatra.error'].message) # if is somewhat uneccessary because the route will have already returned if an error occured due to the rescues, but this works as a last catch all


  # catch errrors
  # charge object will not have paid attribute if payment did not succeed
  # source: http://stackoverflow.com/questions/26985956/checking-for-a-successful-charge-using-stripe-for-rails
  ticket_ids = []
  if charge["paid"] == true
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
  else
    erb :checkout_err
  end
  # should add test here to see if charge went through

  # once javascript start preventDefault() uncomment next three lines
  # confirmPage = erb :payment_success
  # content_type :json
  # return confirmPage.to_json
  erb :payment_success, :locals => {ticket_ids: ticket_ids}
end