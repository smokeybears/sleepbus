post "/passengers" do 
	passengerInfo = params.to_a
	binding.pry 
	params["passengersInfo"].each_key do |key|
		passenger = Passenger.create({
			first_name: key["0"]["value"],
			last_name: key["1"]["value"],
			email: key["2"]["value"]
			})
		Ticket.create({
			passenger_id: passenger.id,
			trip_id: params["trip_id"]
			})
	end
		content_type :json
	erb:
end

#{"0_passenger"=>{"0"=>{"name"=>"0_first_name", "value"=>"Shayanne"}, "1"=>{"name"=>"0_last_name", "value"=>"Wright"}, "2"=>{"name"=>"0_email", "value"=>"shayannewright@gmail.com"}}}