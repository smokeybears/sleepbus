post "/passengers" do 
	begin
		trip_ids = params["busID"].split(",")
		passengers = []
		params["passengersInfo"].each_key do |key|
			passenger = Passenger.find_or_create_by({
				first_name: params["passengersInfo"][key]["0"]["value"],
				last_name: params["passengersInfo"][key]["1"]["value"],
				email: params["passengersInfo"][key]["2"]["value"]
			})
			if passenger.save
				passengers << passenger
			end
		end
		trips = [Trip.find(trip_ids[0].to_i)]
		if trip_ids.length > 1 
			trips.push(Trip.find(trip_ids[1].to_i))
		end
		content_type :json
		checkoutTemplate = erb :checkout_review, 
		layout: false, 
		locals: {
			trips: trips,
			passengers: passengers,
		}
		session[:passengers] = passengers
		session[:trip_ids] = trip_ids
		return checkoutTemplate.to_json
	rescue ActiveRecord::ConnectionTimeoutError => e 
		puts e
	end
end

#{"0_passenger"=>{"0"=>{"name"=>"0_first_name", "value"=>"Shayanne"}, "1"=>{"name"=>"0_last_name", "value"=>"Wright"}, "2"=>{"name"=>"0_email", "value"=>"shayannewright@gmail.com"}}}

