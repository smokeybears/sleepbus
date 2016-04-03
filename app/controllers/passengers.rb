post "/passengers" do 
	trip_ids = params["busID"].split(",")
	passengers = []
	params["passengersInfo"].each_key do |key|
		passenger = Passenger.create({
			first_name: params["passengersInfo"][key]["0"]["value"],
			last_name: params["passengersInfo"][key]["1"]["value"],
			email: params["passengersInfo"][key]["2"]["value"]
			})
		passengers << passenger
		Ticket.create({
			passenger_id: passenger.id,
			trip_id: trip_ids[0]
			})
		Ticket.create({
			passenger_id: passenger.id,
			trip_id: trip_ids[1]
			})
	end
	content_type :json
	checkoutTemplate = erb :checkout_review, 
	layout: false, 
	locals: {trips: [Trip.find(trip_ids[0].to_i), Trip.find(trip_ids[1].to_i)],
	passengers: passengers,
}
	return checkoutTemplate.to_json
end

#{"0_passenger"=>{"0"=>{"name"=>"0_first_name", "value"=>"Shayanne"}, "1"=>{"name"=>"0_last_name", "value"=>"Wright"}, "2"=>{"name"=>"0_email", "value"=>"shayannewright@gmail.com"}}}