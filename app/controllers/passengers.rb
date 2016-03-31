post "/passengers" do 
	num_passengers = 0
	params["passengersInfo"].each_key do |key|
		num_passengers += 1
		passenger = Passenger.create({
			first_name: params["passengersInfo"][key]["0"]["value"],
			last_name: params["passengersInfo"][key]["1"]["value"],
			email: params["passengersInfo"][key]["2"]["value"]
			})
		Ticket.create({
			passenger_id: passenger.id,
			trip_id: params["trip_id"].to_i
			})
	end
	content_type :json
	checkoutTemplate = erb :stripe_payment, layout: false, locals: {cost: (65.00 * num_passengers), num_passengers: num_passengers}
	return checkoutTemplate.to_json
end

#{"0_passenger"=>{"0"=>{"name"=>"0_first_name", "value"=>"Shayanne"}, "1"=>{"name"=>"0_last_name", "value"=>"Wright"}, "2"=>{"name"=>"0_email", "value"=>"shayannewright@gmail.com"}}}