post "/stripe/charge" do 
  customer = Stripe::Customer.create(
    :email => params["stripeEmail"],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :amount      => (params["cost"].to_i * 100),
    :description => 'Bus ticket Charge',
    :currency    => 'usd',
    :customer    => customer.id
  )
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
  # should add test here to see if charge went through

  # once javascript start preventDefault() uncomment next three lines
  # confirmPage = erb :payment_success
  # content_type :json
  # return confirmPage.to_json
  erb :payment_success, :layout => false
end